import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/model/us_population.dart';

import '../model/usa_model.dart';

class PopulationCtrl extends Cubit<USAStates> {
  PopulationCtrl() : super(InitialState());

  final _dio = Dio();

  List<UsModel> data = [];
  UsaPopulationModel? autoData;

  void getUsaPopulation() {
    emit(LoadingState());

    _dio
        .get(
            "https://datausa.io/api/data?drilldowns=Nation&measures=Population")
        .then((response) {
      autoData = UsaPopulationModel.fromJson(response.data);
      final re = response.data["data"];
      data.clear();
      for (var item in re) {
        data.add(UsModel.fromJson(item));
      }
      // data = response.data["data"].map(
      //   (item) => UsModel.fromJson(item),
      // );
      emit(SuccessState());
    }).catchError((error) {
      print(error);
      emit(ErrorState());
      throw error;
    });
  }
}

abstract class USAStates {}

class InitialState extends USAStates {}

class LoadingState extends USAStates {}

class SuccessState extends USAStates {}

class ErrorState extends USAStates {}
