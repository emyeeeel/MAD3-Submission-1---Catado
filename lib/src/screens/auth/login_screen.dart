import 'package:flutter/material.dart';
import 'package:mobile_mad3/src/controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {

  static const String route = '/auth';
  static const String name = "Login Screen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController email, password;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Log in"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 80,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 2, color: Colors.black), 
              ),
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 80,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 2, color: Colors.black), 
              ),
              child: TextField(
                controller: password,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,0,0,20),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                AuthController.I.logIn(email.text.trim(), password.text.trim());
              },
              child: const Text("Login"),
            ),
          ),
        ),
      ),
    );
  }
}