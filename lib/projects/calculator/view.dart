import 'package:flutter/material.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  //alt enter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Simple Calculator'),
        centerTitle: false,
      ),
      //container
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                _buttonItem("C", Colors.cyan),
                _buttonItem("%", Colors.cyan),
                _buttonItem("D", Colors.cyan),
                _buttonItem("/", Colors.black),
              ],
            ),
            Row(
              children: [
                _buttonItem("7", Colors.cyan),
                _buttonItem("8", Colors.cyan),
                _buttonItem("9", Colors.cyan),
                _buttonItem("x", Colors.black),
              ],
            ),
            Row(
              children: [
                _buttonItem("4", Colors.cyan),
                _buttonItem("5", Colors.cyan),
                _buttonItem("6", Colors.cyan),
                _buttonItem("-", Colors.black),
              ],
            ),
            Row(
              children: [
                _buttonItem("1", Colors.cyan),
                _buttonItem("2", Colors.cyan),
                _buttonItem("3", Colors.cyan),
                _buttonItem("+", Colors.black),
              ],
            ),
            Row(
              children: [
                _buttonItem("0", Colors.cyan),
                _buttonItem(".", Colors.cyan),
                _buttonItem("=", Colors.deepOrange),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buttonItem(String title, [Color color = Colors.black]) => Container(
        margin: const EdgeInsets.all(5),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      );
}
