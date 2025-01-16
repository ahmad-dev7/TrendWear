import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:trend_wear_app/constants/k_constants.dart';

class JwtTokenCubit extends Cubit<JwtTokenState> {
  JwtTokenCubit() : super(JwtTokenInitial());
  void checkJwtToken() {
    String? jwtToken = kSharedPreferences.getString("jwtToken");
    if (jwtToken != null) {
      Map<String, dynamic> decodedJwtToken = JwtDecoder.decode(jwtToken);
      int currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      int expirationTime = decodedJwtToken['exp'];
      _storeData(decodedJwtToken["name"], decodedJwtToken["email"]);
      bool isTokenValid = currentTime < expirationTime;

      if (isTokenValid) {
        emit(JwtTokenValid());
        int remainingTime = expirationTime - currentTime;
        print(remainingTime);
        Future.delayed(Duration(seconds: remainingTime)).whenComplete(() => emit(JwtTokenExpired()));
      } else {
        emit(JwtTokenExpired());
      }
    } else {
      emit(JwtTokenNotCreated());
    }
  }

  void _storeData(String name, String email) {
    kSharedPreferences.setString("name", name);
    kSharedPreferences.setString("email", email);
  }
}

abstract class JwtTokenState {}

class JwtTokenNotCreated extends JwtTokenState {}

class JwtTokenInitial extends JwtTokenState {}

class JwtTokenValid extends JwtTokenState {}

class JwtTokenExpired extends JwtTokenState {}
