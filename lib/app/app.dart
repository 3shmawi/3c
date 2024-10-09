import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/ctrl/countries.dart';

import '../screens/countries.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesCtrl()..getCountriesData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CountriesPage(),
      ),
    );
  }
}
