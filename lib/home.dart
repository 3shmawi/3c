import 'package:flutter/material.dart';

///Scaffold >> المسؤول عن تقسيم الشاشة ووضع كل عنصر في مكانه
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: const Text(
          "Whatsapp",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('im a button');
            },
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(
            Icons.flutter_dash,
            size: 100,
            color: Colors.cyan,
          ),
          Icon(
            Icons.flutter_dash,
            size: 90,
            color: Colors.deepOrange,
          ),
          Icon(
            Icons.flutter_dash,
            size: 80,
            color: Colors.blue,
          ),
          Icon(
            Icons.flutter_dash,
            size: 70,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _item() => Align(
        alignment: Alignment.center,
        child: Container(
          height: 100,
          width: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.black.withOpacity(.7),
              ],
              begin: AlignmentDirectional.bottomCenter,
              end: AlignmentDirectional.centerStart,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.cyan.withOpacity(.3),
                blurRadius: 5,
                offset: const Offset(40, 30),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(.3),
                blurRadius: 5,
                offset: const Offset(-40, -30),
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "HAMZA",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(.3),
                    blurRadius: 5,
                    offset: const Offset(2, 2),
                  ),
                  Shadow(
                    color: Colors.black.withOpacity(.3),
                    blurRadius: 5,
                    offset: const Offset(-2, -2),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

//Row
//Column
//Stack
//Wrap
//Listview
//Overview
