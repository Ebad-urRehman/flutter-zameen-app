import 'package:flutter/material.dart';
import 'package:zameen_flutter/files/auth/authentication.dart';
import 'package:zameen_flutter/files/home/home_page.dart';
import 'package:zameen_flutter/files/login/login_screen.dart';

class Redirect extends StatelessWidget {
  const Redirect({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Authentication().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginScreen();
          }
        });
  }
}
