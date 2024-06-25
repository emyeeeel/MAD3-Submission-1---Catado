import 'package:flutter/cupertino.dart';

class SignUpScreen extends StatefulWidget {

  static const String route = '/signup';
  static const String name = "Sign up Screen";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}