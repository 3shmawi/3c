import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/UserModel.dart';

class UserCtrl extends Cubit<UserStates> {
  UserCtrl() : super(UserInitialState());

  final _dio = Dio();

  UserModel? user;

  void getData() {
    emit(UserLoadingState());
    _dio.get("https://randomuser.me/api/").then((value) {
      user = UserModel.fromJson(value.data);
      print(value.data);
      emit(UserLoadedState());
    }).catchError((error) {
      emit(UserErrorState());
      print(error);
    });
  }
}

abstract class UserStates {}

class UserInitialState extends UserStates {}

class UserLoadingState extends UserStates {}

class UserLoadedState extends UserStates {}

class UserErrorState extends UserStates {}
