import 'package:flutter/material.dart';
import 'package:flutter_children_course/views/page1.dart';
import 'package:flutter_children_course/views/page2.dart';
import 'package:flutter_children_course/views/page3.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 4'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page 4 Content'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page2(),
                  ),
                );
              },
              child: Text("Page2"),
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
                    builder: (context) => Page1(),
                  ),
                  (route) => false,
                );
              },
              child: Text("Page1"),
            ),
          ],
        ),
      ),
    );
  }
}
