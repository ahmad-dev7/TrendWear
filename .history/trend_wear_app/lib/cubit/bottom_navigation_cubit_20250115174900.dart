import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationIndex extends Cubit<int> {
  BottomNavigationIndex(super.initialState);
  void selectedIndex(int index) => emit(index);
}
