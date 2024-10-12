import 'dart:async';

import 'package:flutter/material.dart';

class Ui extends StatefulWidget {
  const Ui({super.key});

  @override
  State<Ui> createState() => _UiState();
}

class _UiState extends State<Ui> {
  double leftLegAngle = .5;
  double rightLegAngle = -.5;

  int counter = 0;

  _repeat() {
    Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(() {
        counter++;
        if (counter.isEven) {
          leftLegAngle = -0.3;
          rightLegAngle = .5;
        } else {
          leftLegAngle = 0.3;
          rightLegAngle = -.5;
        }
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    _repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 63,
              backgroundColor: Colors.cyan,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                radius: 60,
              ),
            ),
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  _bodyItem(angle: 0),
                  _bodyItem(angle: 1, height: 120),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: _bodyItem(angle: -1, height: 120),
                  ),
                  Positioned(
                      top: 140,
                      child: _bodyItem(angle: leftLegAngle, height: 120)),
                  Positioned(
                      top: 140,
                      child: _bodyItem(angle: rightLegAngle, height: 120)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyItem({
    double height = 150,
    double angle = 1,
  }) =>
      Container(
        transform: Matrix4.rotationZ(angle),
        height: height,
        width: 10,
        color: Colors.cyan,
      );
}
//API  LocalDatabase  State management
