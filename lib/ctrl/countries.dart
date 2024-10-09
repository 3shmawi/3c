import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/model/CountryModel.dart';

class CountriesCtrl extends Cubit<CountriesStates> {
  CountriesCtrl() : super(CountriesInitial());

  final _dio = Dio();

  List<CountryModel> data = [];
  List<CountryModel> filteredData = [];

  void getCountriesData() {
    emit(CountriesLoading());
    _dio.get('https://restcountries.com/v3.1/all').then((response) {
      data.clear();
      for (var item in response.data) {
        data.add(CountryModel.fromJson(item));
      }

      emit(CountriesSuccess());
    }).catchError((error) {
      emit(CountriesError());
      throw error;
    });
  }

  void filterCountries(String query) {
    filteredData = data
        .where((country) =>
            country.name!.common!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(CountriesSuccess());
  }
}

abstract class CountriesStates {}

class CountriesInitial extends CountriesStates {}

class CountriesLoading extends CountriesStates {}

class CountriesSuccess extends CountriesStates {}

class CountriesError extends CountriesStates {}
