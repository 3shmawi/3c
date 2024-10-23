import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/app/constants.dart';
import 'package:flutter_children_course/model/EveryThingNews.dart';

class NewsCtrl extends Cubit<NewsStates> {
  NewsCtrl() : super(NewsInitialState());

  String category = AppConstants.newsCategories.first;
  String country = AppConstants.countryCodes.first;

  void setCategory(String category) {
    this.category = category;
    fetchNews();
  }

  void setCountry(String country) {
    this.country = country;
    fetchNews();
  }

  final _dio = Dio();

  List<Articles> articles = [];
  List<Articles> searchResults = [];

  void fetchNews() {
    emit(NewsLoadingState());
    _dio
        .get(AppConstants.topHeadLineApi(
      category: category,
      country: country,
    ))
        .then((response) {
      final json = response.data;
      if (json['articles'] != null) {
        articles = [];
        json['articles'].forEach((v) {
          articles.add(Articles.fromJson(v));
        });
      }
      emit(NewsDataState());
    }).catchError((error) {
      emit(NewsErrorState());
      print('Error: $error');
    });
  }

  final searchCtrl = TextEditingController();

  void search() {
    emit(NewsLoadingState());
    _dio.get(AppConstants.searchApi(searchCtrl.text)).then((response) {
      final json = response.data;
      if (json['articles'] != null) {
        searchResults = [];
        json['articles'].forEach((v) {
          searchResults.add(Articles.fromJson(v));
        });
      }
      emit(NewsDataState());
    }).catchError((error) {
      emit(NewsErrorState());
      print('Error: $error');
    });
  }
}

abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsErrorState extends NewsStates {}

class NewsDataState extends NewsStates {}
