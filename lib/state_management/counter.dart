import 'package:flutter_bloc/flutter_bloc.dart';

//BlocProvider
//BlocBuilder  => buildWhen ()
//BlocListener => listenWhen
//BlocConsumer
//BlocSelector

//context.read<CubitClass>().;
//context.watch<CubitClass>();
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }

  void reset() {
    emit(0);
  }
}
