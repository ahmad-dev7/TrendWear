import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:trend_wear_app/constants/k_constants.dart';

class JwtTokenCubit extends Cubit<JwtTokenState> {
  JwtTokenCubit() : super(JwtTokenInitial());
  void monitorToken() {
    String? jwtToken = kSharedPreferences.getString("jwtToken");
    if (jwtToken != null) {
      Map<String, dynamic> decodedJwtToken = JwtDecoder.decode(jwtToken);
    }
  }
}

abstract class JwtTokenState {}

class JwtTokenInitial extends JwtTokenState {}

class JwtTokenValid extends JwtTokenState {}

class JwtTokenExpired extends JwtTokenState {}
