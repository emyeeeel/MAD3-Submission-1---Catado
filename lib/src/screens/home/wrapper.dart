import 'package:flutter/material.dart';

import '../../routing/router.dart';
import 'home_screen.dart';

class HomeWrapper extends StatefulWidget {
  final Widget? child;
  const HomeWrapper({super.key, this.child});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {

  int index = 0;

  List<String> routes = [HomeScreen.route, "/profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child ?? const Placeholder(),
            bottomNavigationBar: BottomNavigationBar(
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        currentIndex: index,
        onTap: (i) {
          setState(() {
            index = i;
            GlobalRouter.I.router.go(routes[i]);
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}