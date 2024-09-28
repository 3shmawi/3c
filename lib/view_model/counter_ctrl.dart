import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCtrl extends Cubit<int> {
  CounterCtrl() : super(0);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }

  void reset() {
    emit(state * 0);
  }
}
