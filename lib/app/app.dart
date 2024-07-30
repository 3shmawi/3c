import 'package:flutter/material.dart';

import '../projects/calculator/view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorView(),
    );
  }
}
