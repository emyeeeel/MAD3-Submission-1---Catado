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

  String? _image;
  String? get image => _image;

  String? _provider;
  String? get provider => _provider;

  String errorMessage = '';

  logIn(String email, String password) async {
    
    await signUserIn(email, password); 
    AuthController.I.state = AuthState.authenticated;
    await saveDataFromSharedPreferences();
    notifyListeners();
  }

  logInWithGoogle() async {
    await signInWithGoogle();
    AuthController.I.state = AuthState.authenticated;
    await saveDataFromSharedPreferences();
    notifyListeners();
  }

  logOut() async {
    AuthController.I.state = AuthState.unauthenticated;
    await signUserOut();
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.clear();
    //to check clearing of session
    await getDataFromSharedPreferences();
    print("Current User: ${AuthController.I.email}");
    notifyListeners();
  }

  Future<void> signUserIn(String email, String password) async {
    try {

      final User userDetails = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,password: password)).user!;

      _name = "Test User";
      _email = userDetails.email;
      _provider = "EMAIL/PASSWORD AUTH";
      _image = "https://th.bing.com/th/id/OIP.1ysuWzMkrR4WxUAL3jfWEwAAAA?rs=1&pid=ImgDetMain";

    } catch (e) {
      throw Exception(e);
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
      _image = userDetails.photoURL;
    }  catch (e) {
      throw Exception(e);
    }
  }
  Future saveDataFromSharedPreferences() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString('name', _name!);
    await s.setString('email', _email!);
    await s.setString('provider', _provider!);
    await s.setString('image', _image!);
  }

  Future getDataFromSharedPreferences() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _name = s.getString('name');
    _email = s.getString('email');
    _provider = s.getString('provider');
    _image = s.getString('image');
  }
}