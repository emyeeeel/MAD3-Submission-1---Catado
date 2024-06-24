import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
  SimulatedAPI api = SimulatedAPI();

  logIn(String email, String password) async {
    bool isLoggedIn = await api.signUserIn(email, password);
    if (isLoggedIn) {
      state = AuthState.authenticated;
      //should store session

      notifyListeners();
    }
  }

  logOut() async {
    bool isLoggedIn = await api.signUserOut();
    if (isLoggedIn) {
      state = AuthState.unauthenticated;
      //should remove session

      notifyListeners();
    }
  }
}

class SimulatedAPI {

  Future<bool> signUserIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password, 
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception("User not found!");
      } else if (e.code == 'wrong-password') {
        throw Exception("Password does not match!");
      } else {
        throw Exception("Authentication failed");
      }
      return false;
    }
  }

  Future<bool> signUserOut() async{
    await FirebaseAuth.instance.signOut();
    return true;
  }
}