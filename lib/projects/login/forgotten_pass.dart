import 'package:flutter/material.dart';

class ForgottenPassPage extends StatelessWidget {
  const ForgottenPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgotten Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text(
              "Enter your new email",
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email Address',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.cyan),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 49),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan, foregroundColor: Colors.white),
              onPressed: () {},
              child: const Text(
                "Send Reset Password Email",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
