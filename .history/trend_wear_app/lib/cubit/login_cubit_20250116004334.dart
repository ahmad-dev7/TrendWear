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
        Uri.parse(ApiConfig().login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email.trim(),
          "password": password,
        }),
      );
      if (response.statusCode == 200) {
        debugPrint("Asslamoalyekum");
        debugPrint(response.body.toString());
        emit(LoginSuccess(jsonDecode(response.body)["token"]));
      } else {
        debugPrint("Login failed");
        debugPrint(response.body.toString());
        emit(LoginInvalid(jsonDecode(response.body)["message"]));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String jwtToken;
  LoginSuccess(this.jwtToken);
}

class LoginInvalid extends LoginState {
  final String message;
  LoginInvalid(this.message);
}

class LoginFailure extends LoginState {
  final String errorMessage;
  LoginFailure(this.errorMessage);
}
