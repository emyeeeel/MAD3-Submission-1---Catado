
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_mad3/src/controllers/auth_controller.dart';
import 'package:mobile_mad3/src/enum/enum.dart';
import 'package:mobile_mad3/src/screens/auth/login_screen.dart';
import 'package:mobile_mad3/src/screens/auth/sign_up_screen.dart';
import 'package:mobile_mad3/src/screens/home/profile.dart';

import '../screens/home/home_screen.dart';
import '../screens/home/home_wrapper.dart';

class GlobalRouter{
  // Static method to initialize the singleton in GetIt
  static void initialize() {
    GetIt.instance.registerSingleton<GlobalRouter>(GlobalRouter());
  }

  // Static getter to access the instance through GetIt
  static GlobalRouter get instance => GetIt.instance<GlobalRouter>();

  static GlobalRouter get I => GetIt.instance<GlobalRouter>();

  late GoRouter router;
  late GlobalKey<NavigatorState> _rootNavigatorKey;
  late GlobalKey<NavigatorState> _shellNavigatorKey;

  FutureOr<String?> handleRedirect(
      BuildContext context, GoRouterState state) async {
    if (AuthController.I.state == AuthState.authenticated) {
      if (state.matchedLocation == LoginScreen.route) {
        return HomeScreen.route;
      }
      return null;
    }
    
    if (AuthController.I.state != AuthState.authenticated) {
      if (state.matchedLocation == LoginScreen.route) {
         return null;
      }
      else if (state.matchedLocation == SignUpScreen.route) {
        return null; 
      }
      return LoginScreen.route;
    }
    return null;
  }

  GlobalRouter(){
    _rootNavigatorKey = GlobalKey<NavigatorState>();
    _shellNavigatorKey = GlobalKey<NavigatorState>();

    router = GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: HomeScreen.route,
        redirect: handleRedirect,
        refreshListenable: AuthController.I,
        routes: [
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: LoginScreen.route,
            name: LoginScreen.name,
            builder: (context, _) {
              return const LoginScreen();
          }),
          GoRoute( 
            parentNavigatorKey: _rootNavigatorKey,
            path: SignUpScreen.route,
            name: SignUpScreen.name,
            builder: (context, _) {
              return const SignUpScreen();
            },
          ),
          ShellRoute(
              navigatorKey: _shellNavigatorKey,
              routes: [
                GoRoute(
                    parentNavigatorKey: _shellNavigatorKey,
                    path: HomeScreen.route,
                    name: HomeScreen.name,
                    builder: (context, _) {
                      return const HomeScreen();
                    }),
                GoRoute(
                    parentNavigatorKey: _shellNavigatorKey,
                    path: ProfileScreen.route,
                    name: ProfileScreen.name,
                    builder: (context, _) {
                      return const ProfileScreen();
                    }),
              ],
              builder: (context, state, child) {
                return HomeWrapper(
                  child: child,
                );
      }),
    ]);
  }
}