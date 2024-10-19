import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/view_model/counter_ctrl.dart';
import 'package:flutter_children_course/view_model/theme_ctrl.dart';
import 'package:flutter_children_course/views/api/countries.dart';

import '../view_model/country_ctrl.dart';
import '../view_model/population_ctrl.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryCtrl>(
            create: (context) => CountryCtrl()..getData()),
        BlocProvider<CounterCtrl>(create: (context) => CounterCtrl()),
        BlocProvider<ThemeCtrl>(create: (context) => ThemeCtrl()),
        BlocProvider<Ctrl>(create: (context) => Ctrl()),
        BlocProvider<PopulationCtrl>(
            create: (context) => PopulationCtrl()..getUsaPopulation()),
      ],
      child: BlocBuilder<ThemeCtrl, bool>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              primaryColor: Colors.cyan,
              colorScheme: const ColorScheme.light(
                primary: Colors.cyan,
              ),
            ),
            darkTheme: ThemeData(
              primaryColor: Colors.cyan,
              colorScheme: const ColorScheme.dark(
                primary: Colors.cyan,
              ),
            ),
            themeMode: state ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const CountriesView(),
          );
        },
      ),
    );
  }
}
