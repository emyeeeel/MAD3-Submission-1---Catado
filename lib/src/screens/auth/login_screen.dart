import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_mad3/src/controllers/auth_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
    return CupertinoPageScaffold(
      // navigationBar: CupertinoNavigationBar(
        
      //   backgroundColor: Colors.deepPurple[200],
      //   middle: Text('Log in Screen'),
      // ),
      child: Center(
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
                obscureText: true,
              ),
            ),
            const SizedBox(height: 50,),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .80,
                child: CupertinoButton.filled(
                  onPressed: () async {
                    await AuthController.I.logIn(email.text.trim(), password.text.trim());
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
                Container(
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: Colors.black)
                  ),
                  child: SvgPicture.asset('lib/src/assets/logos/google_logo.svg', fit: BoxFit.scaleDown,),
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
            const Text("Or sign up with:"),
          ],
        ),
      )
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     centerTitle: true,
    //     automaticallyImplyLeading: false,
    //     title: const Text("Log in"),
    //   ),
    //   body: Center(
    //     child: Column(
    //       children: [
    //         Container(
    //           width: MediaQuery.of(context).size.width - 80,
    //           height: 50,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(25),
    //             border: Border.all(width: 2, color: Colors.black), 
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.fromLTRB(20,0,0,0),
    //             child: TextField(
    //               controller: email,
    //               decoration: const InputDecoration(
    //                 hintText: 'Email',
    //                 border: InputBorder.none,
    //               ),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(height: 20,),
    //         Container(
    //           width: MediaQuery.of(context).size.width - 80,
    //           height: 50,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(25),
    //             border: Border.all(width: 2, color: Colors.black), 
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.fromLTRB(20,0,0,0),
    //             child: TextField(
    //               controller: password,
    //               decoration: const InputDecoration(
    //                 hintText: 'Password',
    //                 border: InputBorder.none,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    //   bottomNavigationBar: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.fromLTRB(0,0,0,20),
    //       child: Container(
    //         margin: const EdgeInsets.symmetric(horizontal: 24),
    //         height: 52,
    //         child: ElevatedButton(
    //           onPressed: () {
    //             AuthController.I.logIn(email.text.trim(), password.text.trim());
    //           },
    //           child: const Text("Log in"),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}