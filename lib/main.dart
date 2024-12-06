import 'package:flutter/material.dart';

import 'home.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hamza App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // تطبيق الصفحة الر��يسية على HomePage

      home: const HomePage(),
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
