import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/app/constants.dart';
import 'package:flutter_children_course/model/EveryThingNews.dart';

class NewsCtrl extends Cubit<NewsStates> {
  NewsCtrl() : super(NewsInitialState());

  int currentIndex = 0;
  Map<String, dynamic> country = AppConstants.countries.first;

  void setCategory(int index) {
    currentIndex = index;
    fetchNews();
  }

  void setCountry(Map<String, dynamic> country) {
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
      category: AppConstants.newsCategories[currentIndex],
      country: country['code'].toLowerCase(),
    ))
        .then((response) {
      final json = response.data;
      print(json);
      if (json['articles'] != null) {
        articles = [];
        json['articles'].forEach((v) {
          articles.add(Articles.fromJson(v));
        });
      }
      print(articles.length);
      print(articles.first.title);
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
