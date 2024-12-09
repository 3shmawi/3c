import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_children_course/ui/home/widgets.dart';

import '../../model/news.dart';

//
class NewsHomeView extends StatefulWidget {
  const NewsHomeView({
    required this.category,
    required this.img,
    super.key,
  });

  final String category;
  final String img;

  @override
  State<NewsHomeView> createState() => _NewsHomeViewState();
}

class _NewsHomeViewState extends State<NewsHomeView> {
  final dio = Dio();

  List<ArticleModel> articles = [];

  void fetchData() {
    dio
        .get(
            "https://newsapi.org/v2/top-headlines?category=${widget.category}&apiKey=2fbf9799a7fb47c88f266c543fb36a78")
        .then((response) {
      if (response.statusCode == 200) {
        final newsData = response.data['articles'] as List<dynamic>;
        setState(() {
          articles =
              newsData.map((json) => ArticleModel.fromJson(json)).toList();
        });
      } else {
        print('Failed to fetch data');
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.toUpperCase()),
      ),
      body: articles.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(6), // Add padding to the list view
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return NewHomeItem(articles[index]);
              },
            ),
    );
  }
}
