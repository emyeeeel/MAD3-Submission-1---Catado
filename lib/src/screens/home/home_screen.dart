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
            //to check current user session validation
            print("Current User: ${AuthController.I.email}");
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Home"),
                  Text('Auth provider: ${AuthController.I.provider ?? ""}'),
                  Text('Current user name: ${AuthController.I.name ?? ""}'),
                  Text('Current user email: ${AuthController.I.email ?? ""}'),
                ],
              ),
            );
          }
        }
      )
    );
  }
}