import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:trend_wear_app/config/config.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  void login(String email, String password) async {
    debugPrint("${email.trim()}\n$password");
    emit(LoginLoading());
    try {
      final response = await http.post(
        Uri.parse(ApiConfig().login), // Update to your backend URL
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email.trim(),
          "password": password,
        }),
      );
      if (response.statusCode == 200) {
        debugPrint("Asslamoalyekum");
        debugPrint(response.body.toString());
        emit(LoginSuccess());
      } else {
        debugPrint("Login failed");
        debugPrint(response.body.toString());
        emit(LoginFailure(response.body.toString()));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String errorMessage;
  LoginFailure(this.errorMessage);
}
