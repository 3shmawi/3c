import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCtrl extends Cubit<int> {
  CounterCtrl() : super(10);

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

//this  super
class Ctrl extends Cubit<AppCtrlStates> {
  Ctrl() : super(AppInitialState());

  int counter = 0;

  void increment() {
    counter++;
    emit(IncrementState());
  }

  void decrement() {
    counter--;
    emit(DecrementState());
  }

  void reset() {
    counter = 0;
    emit(ResetState());
  }
}

abstract class AppCtrlStates {}

class AppInitialState extends AppCtrlStates {}

class IncrementState extends AppCtrlStates {}

class DecrementState extends AppCtrlStates {}

class ResetState extends AppCtrlStates {}
