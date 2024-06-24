import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_mad3/firebase_options.dart';

import 'src/controllers/auth_controller.dart';
import 'src/routing/router.dart';

Future<void> main() async {
  AuthController.initialize();
  GlobalRouter.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GlobalRouter.I.router,
      title: 'Stateful Changes Demo',
      theme: const CupertinoThemeData(brightness: Brightness.light),
    );
  }
}
