import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_mad3/src/screens/auth/login_screen.dart';

import '../../routing/router.dart';

class SignUpScreen extends StatefulWidget {

  static const String route = '/signup';
  static const String name = "Sign Up Screen";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  late TextEditingController email, password, confirmPassword;
  late bool isClicked = false;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return CupertinoPageScaffold(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80,),
            GestureDetector(
              onTap: () => GlobalRouter.I.router.go(LoginScreen.route),
              child: const Row(
                children: [
                  SizedBox(width: 25,),
                  Icon(Icons.arrow_back_ios),
                ],
              )
            ),
            const SizedBox(height: 70,),
            const Text("Create your Account"),
            const SizedBox(height: 30,),
            SizedBox(
              width: MediaQuery.of(context).size.width * .80,
              height: 50,
              child: CupertinoTextField(
                controller: email,
                placeholder: "Enter email",
                placeholderStyle: const TextStyle(color: CupertinoColors.inactiveGray),
                decoration: BoxDecoration(
                  color: CupertinoColors.white, 
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: CupertinoColors.inactiveGray, 
                    width: 1.0, 
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: MediaQuery.of(context).size.width * .80,
              height: 50,
              child: CupertinoTextField(
                controller: password,
                placeholder: "Enter password",
                placeholderStyle: const TextStyle(color: CupertinoColors.inactiveGray),
                decoration: BoxDecoration(
                  color: CupertinoColors.white, 
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: CupertinoColors.inactiveGray, 
                    width: 1.0, 
                  ),
                ),
                obscureText: isClicked ? false : true,
                suffix: GestureDetector(
                  onTap: () {
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
            const SizedBox(height: 20,),
            SizedBox(
              width: MediaQuery.of(context).size.width * .80,
              height: 50,
              child: CupertinoTextField(
                controller: password,
                placeholder: "Confirm password",
                placeholderStyle: const TextStyle(color: CupertinoColors.inactiveGray),
                decoration: BoxDecoration(
                  color: CupertinoColors.white, 
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: CupertinoColors.inactiveGray, 
                    width: 1.0, 
                  ),
                ),
                obscureText: isClicked ? false : true,
                suffix: GestureDetector(
                  onTap: () {
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
                  onPressed: (){},
                  child: const Text("Sign up"),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            const Text("Or sign up with:"),
            const SizedBox(height: 30,),
            Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () async { 
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
        ],
      ),)
    );
  }
}