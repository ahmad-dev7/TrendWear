import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  void signup(String name, String email, String password) async {
    emit(SignupLoading());
    try {
      var url = '$kBaseUrl/registration';
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name.allWordsCapitilize().trimRight(),
          'email': email.trim(),
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        debugPrint("Asslamoalyekum");
        emit(SignupSuccess());
      } else {
        debugPrint("Oye pollis aagyi pollis");
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
