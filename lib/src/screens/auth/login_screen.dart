import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  static const String route = '/auth';
  static const String name = "Login Screen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Login Screen'),
      ),
    );
  }
}