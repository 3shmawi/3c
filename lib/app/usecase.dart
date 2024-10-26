//loading   empty    success    failure

import 'package:flutter/material.dart';

enum CaseStates {
  loading,
  empty,
  success,
  failure,
}

class AppStatus extends StatelessWidget {
  const AppStatus(
    this.state, {
    this.body,
    this.errorText,
    super.key,
  });

  final CaseStates state;
  final String? errorText;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case CaseStates.loading:
        {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.cyan, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Loading...'),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        }
      case CaseStates.failure:
        {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outlined,
                  color: Colors.red,
                  size: 100,
                ),
                const SizedBox(height: 16),
                const Text(
                  'An error occurred while loading',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  ),
                ),
                Text(
                  errorText ?? 'No error text provided',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          );
        }
      case CaseStates.empty:
        {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.folder_off_outlined,
                  color: Colors.cyanAccent,
                  size: 100,
                ),
                SizedBox(height: 16),
                Text(
                  'No data found',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.cyanAccent,
                  ),
                ),
              ],
            ),
          );
        }
      case CaseStates.success:
        {
          return body ?? const SizedBox.shrink();
        }
    }
  }
}
