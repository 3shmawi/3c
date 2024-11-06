import 'package:flutter/material.dart';

enum UseCase {
  loading,
  error,
  empty,
}

class UseCaseBuild extends StatelessWidget {
  const UseCaseBuild(this.useCase, {super.key});

  final UseCase useCase;

  @override
  Widget build(BuildContext context) {
    switch (useCase) {
      case UseCase.loading:
        return const Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading...'),
                ],
              ),
            ),
          ),
        );
      case UseCase.error:
        return const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 150,
                ),
                SizedBox(height: 10),
                Text(
                  'There is an Error',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 10),
                Text('Please try again'),
              ],
            ),
          ),
        );
      case UseCase.empty:
        return const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.newspaper_rounded,
                  color: Colors.cyan,
                  size: 150,
                ),
                SizedBox(height: 10),
                Text(
                  'There is no data found',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.cyan,
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }
}
