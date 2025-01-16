import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_wear_app/screens/login_signup_screen.dart';

class TogglerCubit extends Cubit<bool> {
  TogglerCubit() : super(true);
  void toggle([bool? value]) {
    emit(value ?? !state);
    flipCardKey.currentState!.toggleCard();
  }
}
