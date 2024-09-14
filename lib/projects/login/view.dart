import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 60.0,
                  color: Colors.cyan,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Welcome back to our app",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.cyan,
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.cyan),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.cyan),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgotten the password?"),
                ),
              ),
              const SizedBox(
                height: 35.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.cyan,
                  minimumSize: const Size(300, 50),
                ),
                onPressed: () {},
                child: const Text("LOGIN"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                  ),
                  TextButton(
                      onPressed: () {}, child: const Text("Sign up now."))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
