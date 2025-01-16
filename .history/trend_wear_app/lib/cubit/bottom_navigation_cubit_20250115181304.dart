import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationIndex extends Cubit<int> {
  BottomNavigationIndex() : super(0);
  void updateIndex(int index) => emit(index);
}
