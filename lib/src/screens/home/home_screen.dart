import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_mad3/src/controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {

  static const String route = '/home';
  static const String name = "Home Screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return CupertinoPageScaffold(
      child: FutureBuilder(
        future: AuthController.I.getDataFromSharedPreferences(),
        builder: (context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          } else {
            print(AuthController.I.email);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Home"),
                  Text('${AuthController.I.provider ?? ""}'),
                  Text('${AuthController.I.name ?? ""}'),
                  Text('${AuthController.I.email ?? ""}'),
                ],
              ),
            );
          }
        }
      )
    );
  }
}