import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:trend_wear_app/constants/k_constants.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  void signup(String email, String password) async {
    emit(SignupLoading());
    try {
      var url = '$kBaseUrl/registration';
      final response = await http.post(
        Uri.parse(url),
        body: {"email": "frommobile@gmail.com", "password": "mobilePassword"},
      );
      if (response.statusCode == 200) {
        print("Asslamoalyekum");
        emit(SignupSuccess());
      } else {
        print("Oye pollis aagyi pollis");
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
