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

  void getData() {
    emit(CountryDataLoading());
    _dio.get('https://restcountries.com/v3.1/all').then((response) {
      final countries = response.data;
      data.clear();
      for (var country in countries) {
        data.add(CountryModel.fromJson(country));
      }

      data.sort((a, b) => a.name.compareTo(b.name));
      emit(CountryDataLoaded());
    }).catchError((error) {
      emit(CountryDataFailed());
      print('Failed to load data: $error');
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
}

abstract class CountryStates {}

class CountryInitialState extends CountryStates {}

class CountryDataLoading extends CountryStates {}

class CountryDataLoaded extends CountryStates {}

class CountryDataFailed extends CountryStates {}
