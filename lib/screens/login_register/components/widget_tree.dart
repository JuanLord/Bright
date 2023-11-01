import 'package:bright_app/authentication/auth.dart';
import 'package:bright_app/screens/dashboaerd_screen.dart';
import 'package:bright_app/screens/home/home_screen.dart';
import 'package:bright_app/screens/login_register/login_screen.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        print("object");
        print("SNAPSHOTT " + "${snapshot.hasData}");
        if (snapshot.hasData) {
          return DashboardScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
