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
        var token = jsonDecode(response.body)["token"];
        emit(LoginSuccess(token));
        debugPrint(token);
      } else {
        var message = jsonDecode(response.body)["message"];
        emit(LoginInvalid(message));
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
