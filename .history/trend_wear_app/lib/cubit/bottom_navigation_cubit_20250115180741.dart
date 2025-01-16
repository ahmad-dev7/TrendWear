import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationIndex extends Cubit<int> {
  BottomNavigationIndex(super.initialState);
  void updateIndex(int index) => emit(index);
}
