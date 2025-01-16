import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:trend_wear_app/config/config.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  Future<void> signup(String name, String email, String password) async {
    emit(SignupLoading());
    var body = jsonEncode({
      'name': name.allWordsCapitilize().trimRight(),
      'email': email.trim(),
      'password': password,
    });
    try {
      final response = await http.post(
        Uri.parse(ApiConfig().signup),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      if (response.statusCode == 200) {
        debugPrint("Asslamoalyekum");
        //! On emit of signupSuccess , the login method will be executed with this same credentials to generate jwtToken and then user will be logged in
        emit(SignupSuccess());
      } else {
        debugPrint("Signup failed");
        emit(SignupFailure(response.body.toString()));
      }
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupFailure extends SignupState {
  final String errorMessage;
  SignupFailure(this.errorMessage);
}
