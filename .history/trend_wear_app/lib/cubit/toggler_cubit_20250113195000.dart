import 'package:flutter_bloc/flutter_bloc.dart';

class TogglerCubit extends Cubit<bool> {
  TogglerCubit() : super(true);
  void toggle([bool? value]) => emit(value ?? !state);
}
