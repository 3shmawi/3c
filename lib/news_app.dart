import 'package:flutter/material.dart';
import 'package:flutter_children_course/ui/layout/view.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutView(),
    );
  }
}
