import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_children_course/model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? user;
  final _dio = Dio();

  void _getUser() {
    _dio
        .get('https://randomuser.me/api')
        .then(
          (response) => setState(
            () {
              user = UserModel.fromMap(response.data);
            },
          ),
        )
        .catchError((error) {
      print('Error: $error');
    });
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          'Random user',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Center(
        child: user == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 54,
                    backgroundColor: Colors.cyan,
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.cyan,
                      ),
                      height: 100,
                      width: 100,
                      child: Image.network(
                        user!.image,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          }
                        },
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Center(
                            child: Text(
                              'Failed to load image',
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(user!.name),
                  const SizedBox(height: 8),
                  Text(user!.email),
                  const SizedBox(height: 8),
                ],
              ),
      ),
    );
  }
}
