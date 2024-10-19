import 'package:flutter/material.dart';
import 'package:flutter_children_course/views/page1.dart';
import 'package:flutter_children_course/views/page3.dart';
import 'package:flutter_children_course/views/page4.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page 2 Content'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page1(),
                  ),
                );
              },
              child: Text("Page1"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page3(),
                  ),
                );
              },
              child: Text("Page3"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page4(),
                  ),
                  (route) => false,
                );
              },
              child: Text("Page4"),
            ),
          ],
        ),
      ),
    );
  }
}
