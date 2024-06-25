import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_mad3/src/controllers/auth_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {

  static const String route = '/login';
  static const String name = "Login Screen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController email, password;

  late bool isClicked;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
    isClicked = false;
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: FutureBuilder(
        future: AuthController.I.getDataFromSharedPreferences(),
        builder: (context, AsyncSnapshot<void> snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Log in to your Account"),
                const SizedBox(height: 30,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .80,
                  height: 50,
                  child: CupertinoTextField(
                    controller: email,
                    placeholder: "Enter email",
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .80,
                  height: 50,
                  child: CupertinoTextField(
                    controller: password,
                    placeholder: "Enter password",
                    obscureText: isClicked ? false : true,
                    suffix: GestureDetector(
                      onTap: () {
                        print('${AuthController.I.email}');
                        setState(() {
                          isClicked = !isClicked;
                        });
                      },
                      child: SizedBox(
                        child: Row(
                          children: [
                            Icon(isClicked ? Icons.visibility : Icons.visibility_off),
                            const SizedBox(width: 10,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .80,
                    child: CupertinoButton.filled(
                      onPressed: () async {
                        showCupertinoDialog(
                          context: context, 
                          builder: (context) {
                            return const Center(child: CupertinoActivityIndicator());
                          }
                        );
                        AuthController.I.logIn(email.text.trim(), password.text.trim());
                        await Future.delayed(Durations.medium1);
                      },
                      child: const Text("Sign in"),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                const Text("Or sign in with:"),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () async { 
                        showCupertinoDialog(
                          context: context, 
                          builder: (context) {
                            return const Center(child: CupertinoActivityIndicator());
                          }
                        );
                        AuthController.I.logInWithGoogle();
                        await Future.delayed(Durations.medium1);
                      },
                      child: Container(
                        width: 100,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1, color: Colors.black)
                        ),
                        child: SvgPicture.asset('lib/src/assets/logos/google_logo.svg', fit: BoxFit.scaleDown,),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Colors.black)
                      ),
                      child: SvgPicture.asset('lib/src/assets/logos/facebook_logo.svg', fit: BoxFit.scaleDown,),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Colors.black)
                      ),
                      child: SvgPicture.asset('lib/src/assets/logos/twitter_logo.svg', fit: BoxFit.scaleDown,),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 100,),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Dont't have an account? ",
                        style: TextStyle(fontWeight: FontWeight.normal, color:  Colors.black), 
                      ),
                      TextSpan(
                        text: "Sign up",
                        style: TextStyle(fontWeight: FontWeight.bold, color:  Colors.blue), 
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      )
    );
  }
}