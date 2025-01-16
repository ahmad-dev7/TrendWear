import 'package:flutter_bloc/flutter_bloc.dart';

class LoginSignupCubit extends Cubit<LoginSignupState> {}

class LoginSignupData {
  final String email;
  final String password;
  LoginSignupData({required this.email, required this.password});
}
