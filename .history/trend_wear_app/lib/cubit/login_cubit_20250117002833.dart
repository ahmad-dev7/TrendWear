import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:trend_wear_app/config/config.dart';
import 'package:trend_wear_app/constants/k_constants.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  void updateState(LoginState loginState) => emit(loginState);
  Future<void> login(String email, String password) async {
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
        var data = jsonDecode(response.body);
        await kSharedPreferences.setString("jwtToken", data["token"]);
        await kSharedPreferences.setString("name", data["name"]);
        await kSharedPreferences.setString("email", data["email"]);
        emit(LoginSuccess());
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

class LoginSuccess extends LoginState {}

class LoginInvalid extends LoginState {
  final String message;
  LoginInvalid(this.message);
}

class LoginFailure extends LoginState {
  final String errorMessage;
  LoginFailure(this.errorMessage);
}
