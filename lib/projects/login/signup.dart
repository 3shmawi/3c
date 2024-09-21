import 'package:flutter/material.dart';
import 'package:flutter_children_course/projects/login/view.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
                "SIGN UP",
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
                  hintText: 'User name',
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
                child: const Text("SIGNUP"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
