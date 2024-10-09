import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/view_model/counter_ctrl.dart';
import 'package:flutter_children_course/view_model/theme_ctrl.dart';

import '../view_model/population_ctrl.dart';
import '../views/api/usa_population.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
            home: const UsaPopulation(),
          );
        },
      ),
    );
  }
}
