import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/ctrl/countries.dart';
import 'package:flutter_children_course/ctrl/news.dart';

import '../screens/news.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CountriesCtrl()..getCountriesData()),
        BlocProvider(create: (context) => NewsCtrl()..fetchNews()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NewsScreen(),
      ),
    );
  }
}
