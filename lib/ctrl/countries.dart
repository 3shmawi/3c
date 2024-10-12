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
      for (int i = 0; i < response.data.length; i++) {
        data.add(CountryModel.fromJson(response.data[i]));
      }
      data.sort((a, b) => a.name!.common!.compareTo(b.name!.common!));

      // countries.sort();
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
    filteredData.sort((a, b) => a.name!.common!.compareTo(b.name!.common!));

    emit(CountriesSuccess());
  }
}

abstract class CountriesStates {}

class CountriesInitial extends CountriesStates {}

class CountriesLoading extends CountriesStates {}

class CountriesSuccess extends CountriesStates {}

class CountriesError extends CountriesStates {}
