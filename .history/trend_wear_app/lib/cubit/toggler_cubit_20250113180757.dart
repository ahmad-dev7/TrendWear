import 'package:flutter_bloc/flutter_bloc.dart';

class TogglerCubit extends Cubit<bool> {
  final bool initialState;
  TogglerCubit(this.initialState) : super(initialState);

  void toggle() => emit(state);
}
