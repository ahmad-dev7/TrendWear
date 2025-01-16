import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:trend_wear_app/constants/k_constants.dart';

class JwtTokenCubit extends Cubit<JwtTokenState> {
  JwtTokenCubit() : super(JwtTokenInitial()) {
    monitorToken();
  }
  void monitorToken() {
    String? jwtToken = kSharedPreferences.getString("jwtToken");
    if (jwtToken != null) {
      Map<String, dynamic> decodedJwtToken = JwtDecoder.decode(jwtToken);
      int currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      int expirationTime = decodedJwtToken['exp'];
      bool isTokenValid = currentTime < expirationTime;
      if (isTokenValid) {
        emit(JwtTokenValid());
        int remainingTime = expirationTime - currentTime;
        Future.delayed(Duration(seconds: remainingTime)).whenComplete(() => emit(JwtTokenExpired()));
      } else {
        emit(JwtTokenExpired());
      }
    } else {
      emit(JwtTokenNotCreated());
    }
  }
}

abstract class JwtTokenState {}

class JwtTokenNotCreated extends JwtTokenState {}

class JwtTokenInitial extends JwtTokenState {}

class JwtTokenValid extends JwtTokenState {}

class JwtTokenExpired extends JwtTokenState {}
