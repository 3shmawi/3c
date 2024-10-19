import 'package:flutter/material.dart';
import 'package:flutter_children_course/views/page2.dart';
import 'package:flutter_children_course/views/page3.dart';
import 'package:flutter_children_course/views/page4.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page 1 Content'),
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
