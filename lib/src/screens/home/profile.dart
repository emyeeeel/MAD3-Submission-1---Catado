import 'package:flutter/material.dart';
import 'package:mobile_mad3/src/controllers/auth_controller.dart';

class ProfileScreen extends StatelessWidget {

  static const String route = '/profile';
  static const String name = "Profile Screen";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Center(child: Text("Profile")),
         ElevatedButton(
          onPressed: (){
            AuthController.I.logOut();
          }, 
          child: const Text("Log out"),
        )
       ],
     );
  }
}