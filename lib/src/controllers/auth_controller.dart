import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../enum/enum.dart';

class AuthController with ChangeNotifier {
  // Static method to initialize the singleton in GetIt
  static void initialize() {
    GetIt.instance.registerSingleton<AuthController>(AuthController());
  }

  // Static getter to access the instance through GetIt
  static AuthController get instance => GetIt.instance<AuthController>();

  static AuthController get I => GetIt.instance<AuthController>();

  AuthState state = AuthState.unauthenticated;

  String? _name;
  String? get name => _name;

  String? _email;
  String? get email => _email;

  String? _provider;
  String? get provider => _provider;


  logIn(String email, String password) async {
    await signUserIn(email, password);
    final SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString('name', _name!);
    await s.setString('email', _email!);
    await s.setString('provider', _provider!);
    notifyListeners();
  }

  logInWithGoogle() async {
    await signInWithGoogle();
    final SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString('name', _name!);
    await s.setString('email', _email!);
    await s.setString('provider', _provider!);
    notifyListeners();
  }

  logOut() async {
    await signUserOut();
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.clear();
    notifyListeners();
  }

  Future<void> signUserIn(String email, String password) async {
    try {

      final User userDetails = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,password: password)).user!;

      _name = "Test User";
      _email = userDetails.email;
      _provider = "EMAIL/PASSWORD AUTH";

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception("User not found!");
      } else if (e.code == 'wrong-password') {
        throw Exception("Password does not match!");
      } else {
        throw Exception("Authentication failed");
      }
    }
  }

  Future<void> signUserOut() async{
    await FirebaseAuth.instance.signOut();
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // signing to firebase user instance
      final User userDetails = (await FirebaseAuth.instance.signInWithCredential(credential)).user!;

      _name = userDetails.displayName;
      _email = userDetails.email;
      _provider = "GOOGLE AUTH";
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
  }

  Future getDataFromSharedPreferences() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _name = s.getString('name');
    _email = s.getString('email');
    _provider = s.getString('provider');
    notifyListeners();
  }
}