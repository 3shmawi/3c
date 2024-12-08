import 'package:flutter/material.dart';

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
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: 200,
          width: 400,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // gradient: LinearGradient(
            //   colors: [
            //     Colors.cyan,
            //     Colors.black.withOpacity(.7),
            //   ],
            //   begin: AlignmentDirectional.bottomCenter,
            //   end: AlignmentDirectional.centerStart,
            // ),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(.3),
            //     blurRadius: 5,
            //     offset: const Offset(40, 30),
            //   ),
            //   BoxShadow(
            //     color: Colors.black.withOpacity(.3),
            //     blurRadius: 5,
            //     offset: const Offset(-40, -30),
            //   ),
            // ],
          ),
          child: Expanded(
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
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
