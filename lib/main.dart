import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_children_course/state_management/counter.dart';
import 'package:flutter_children_course/state_management/theme.dart';
import 'package:flutter_children_course/ui/counter.dart';

//MaterialApp التطبيق كامل فيه واحده بس من
//Scaffold كل بداية صفحة في التطبيق
//AppBar, Text, Icon, IconButton
//Container

void main() {
  runApp(const HamzaApp());
}

class HamzaApp extends StatelessWidget {
  const HamzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDark) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Hamza App',
            theme: ThemeData(
              primarySwatch: Colors.cyan,
              colorScheme: const ColorScheme.light(primary: Colors.cyan),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.cyan,
              colorScheme: const ColorScheme.dark(primary: Colors.cyan),
            ),
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            home: BlocProvider(
              create: (context) => CounterCubit(),
              child: const CounterView(),
            ),
          );
        },
      ),
    );
  }
}

/*
Container(
a:sdf,

),
 */

toPage(BuildContext context, Widget page) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));

extension Nav on BuildContext {
  void toPage(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
  }

// theme()=>Theme.of(this).s;
}
