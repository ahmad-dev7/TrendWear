import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  void signup(String email, String password) {
    emit(SignupLoading());
    try {} catch (e) {
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
