import 'package:flutter/material.dart';
import 'package:flutter_children_course/home.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

/*
Container(
a:sdf,

),
 */
