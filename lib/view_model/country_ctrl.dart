import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/model/country.dart';

class CountryCtrl extends Cubit<CountryStates> {
  CountryCtrl() : super(CountryInitialState());

//super   for   father    and this for    current scope
  final _dio = Dio();

  List<CountryModel> data = [];
  List<CountryModel> results = [];
  Map<String, int> alphabetIndex = {};

  void getData() {
    emit(CountryDataLoading());
    _dio.get('https://restcountries.com/v3.1/all').then((response) {
      final countries = response.data;
      data.clear();
      for (int i = 0; i < countries.length; i++) {
        data.add(CountryModel.fromJson(countries[i]));
      }

      data.sort((a, b) => a.name.compareTo(b.name));

      for (int i = 0; i < data.length; i++) {
        bool isNewChar = (i == 0) || (data[i].name[0] != data[i - 1].name[0]);
        if (isNewChar) {
          alphabetIndex[data[i].name[0]] = i;
        }
      }
      emit(CountryDataLoaded());
    }).catchError((error) {
      emit(CountryDataFailed(error.toString()));
      print('Failed to load data: $error');
      throw error;
    });
  }

  final searchCtrl = TextEditingController();

  void search() {
    emit(CountryDataLoading());
    results = data
        .where((country) =>
            country.name.toLowerCase().contains(searchCtrl.text.toLowerCase()))
        .toList();
    emit(CountryDataLoaded());
  }

  int getIndex(String country) {
    return data.indexOf(
        data.firstWhere((c) => c.name.toLowerCase() == country.toLowerCase()));
  }
}

abstract class CountryStates {}

class CountryInitialState extends CountryStates {}

class CountryDataLoading extends CountryStates {}

class CountryDataLoaded extends CountryStates {}

class CountryDataFailed extends CountryStates {
  final String error;

  CountryDataFailed(this.error);
}
