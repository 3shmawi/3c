//main . runApp   MaterialApp

//

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
          title: Text("MY NEW APP"),
          centerTitle: false,
          actions: [
            IconButton(
              icon: Icon(Icons.camera),
              onPressed: () {
                print('yes1');
              },
            ),
            IconButton(
              icon: Icon(Icons.video_call),
              onPressed: () {
                print('yes2');
              },
            ),
            IconButton(
              icon: Icon(Icons.rounded_corner),
              onPressed: () {
                print('yes3');
              },
            ),
            IconButton(
              icon: Icon(Icons.notification_important_outlined),
              onPressed: () {
                print('yes4');
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      ),
    ),
  );
}
