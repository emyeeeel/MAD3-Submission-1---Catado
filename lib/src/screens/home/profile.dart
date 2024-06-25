import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_mad3/src/controllers/auth_controller.dart';

class ProfileScreen extends StatelessWidget {

  static const String route = '/profile';
  static const String name = "Profile Screen";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return CupertinoPageScaffold(
      child: FutureBuilder(
        future: AuthController.I.getDataFromSharedPreferences(),
        builder: (context, AsyncSnapshot<void> snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               const SizedBox(height: 100,),
               const Text("My Profile", 
               style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold, 
                    color: Colors.black, 
                ),
               ),
               const SizedBox(height: 20,),
               SizedBox(
                height: 180,
                 child: Row(
                   children: [
                      const SizedBox(width: 20,),
                      const CircleAvatar(
                          backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.1ysuWzMkrR4WxUAL3jfWEwAAAA?rs=1&pid=ImgDetMain'),
                          radius: 75,
                      ),
                      const SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${AuthController.I.name}", 
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold, 
                                color: Colors.black, 
                            ),
                          ),
                          const SizedBox(height: 15,),
                          Text("${AuthController.I.email}", 
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal, 
                                color: Colors.black, 
                            ),
                          ),
                          const SizedBox(height: 15,),
                          GestureDetector(
                            onTap: () {
                              
                            },
                            child: SizedBox(
                              height: 50,
                              width: 150,
                              child: CupertinoButton.filled(
                                minSize: 0, 
                                padding: const EdgeInsets.all(0), 
                                onPressed: () {
                            
                                },
                                child: const Center(
                                  child: Text(
                                    "Edit Profile",
                                    textAlign: TextAlign.center, 
                                    maxLines: 1, 
                                    overflow: TextOverflow.ellipsis, 
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal, 
                                      color: Colors.white, 
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
          
                        ],
                      ),
                      const SizedBox(width: 20,),
                   ],
                 ),
               ),
               const SizedBox(height: 30,),
               const Row(children: [
                  SizedBox(width: 20,), 
                  Icon(Icons.favorite_outline, color: Colors.black,), 
                  SizedBox(width: 15,), 
                  Text('Favorites'), 
                  Spacer(), 
                  Icon(Icons.arrow_forward_ios, color: Colors.black,), 
                  SizedBox(width: 20,)],
                ),
                const SizedBox(height: 15,),
                const Row(children: [
                  SizedBox(width: 20,), 
                  Icon(Icons.download_rounded, color: Colors.black,), 
                  SizedBox(width: 15,), 
                  Text('Downloads'), 
                  Spacer(), 
                  Icon(Icons.arrow_forward_ios, color: Colors.black,), 
                  SizedBox(width: 20,)],
                ),
                const SizedBox(height: 50,),
                const Row(children: [
                  SizedBox(width: 20,), 
                  Icon(Icons.language, color: Colors.black,), 
                  SizedBox(width: 15,), 
                  Text('Language'), 
                  Spacer(), 
                  Icon(Icons.arrow_forward_ios, color: Colors.black,), 
                  SizedBox(width: 20,)],
                ),
                const SizedBox(height: 15,),
                const Row(children: [
                  SizedBox(width: 20,), 
                  Icon(Icons.location_on, color: Colors.black,), 
                  SizedBox(width: 15,), 
                  Text('Location'), 
                  Spacer(), 
                  Icon(Icons.arrow_forward_ios, color: Colors.black,), 
                  SizedBox(width: 20,)],
                ),
                const SizedBox(height: 15,),
                const Row(children: [
                  SizedBox(width: 20,), 
                  Icon(Icons.display_settings, color: Colors.black,), 
                  SizedBox(width: 15,), 
                  Text('Display'), 
                  Spacer(), 
                  Icon(Icons.arrow_forward_ios, color: Colors.black,), 
                  SizedBox(width: 20,)],
                ),
                const SizedBox(height: 15,),
                const Row(children: [
                  SizedBox(width: 20,), 
                  Icon(Icons.feed, color: Colors.black,), 
                  SizedBox(width: 15,), 
                  Text('Feed Preference'), 
                  Spacer(), 
                  Icon(Icons.arrow_forward_ios, color: Colors.black,), 
                  SizedBox(width: 20,)],
                ),
                const SizedBox(height: 15,),
                const Row(children: [
                  SizedBox(width: 20,), 
                  Icon(Icons.subscriptions, color: Colors.black,), 
                  SizedBox(width: 15,), 
                  Text('Subscription'), 
                  Spacer(), 
                  Icon(Icons.arrow_forward_ios, color: Colors.black,), 
                  SizedBox(width: 20,)],
                ),
                const SizedBox(height: 50,),
                const Row(children: [
                  SizedBox(width: 20,), 
                  Icon(Icons.cached, color: Colors.black,), 
                  SizedBox(width: 15,), 
                  Text('Clear cache'), 
                  Spacer(), 
                  Icon(Icons.arrow_forward_ios, color: Colors.black,), 
                  SizedBox(width: 20,)],
                ),
                const SizedBox(height: 15,),
                const Row(children: [
                  SizedBox(width: 20,), 
                  Icon(Icons.delete, color: Colors.black,), 
                  SizedBox(width: 15,), 
                  Text('Clear history'), 
                  Spacer(), 
                  Icon(Icons.arrow_forward_ios, color: Colors.black,), 
                  SizedBox(width: 20,)],
                ),
                const SizedBox(height: 15,),
                GestureDetector(
                  onTap: () async {
                    showCupertinoDialog(
                      context: context, 
                      builder: (context) {
                        return const Center(child: CupertinoActivityIndicator());
                      }
                    );
                    await Future.delayed(Durations.medium1);
                    AuthController.I.logOut();
                  },
                  child: const SizedBox(
                    child: Row(children: [
                      SizedBox(width: 20,), 
                      Icon(Icons.logout, color: Colors.red,), 
                      SizedBox(width: 15,), 
                      Text('Log out', style: TextStyle(color: Colors.red),), 
                      ],
                    ),
                  ),
                ),
             ],
           );
        }
      ),
     );
  }
}