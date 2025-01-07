import 'package:flutter/material.dart';
import 'package:zameen_flutter/files/auth/authentication.dart';
import 'package:zameen_flutter/files/home/home_page.dart';
import 'package:zameen_flutter/files/login/login_screen.dart';
import 'package:zameen_flutter/files/store%20data/manage_share_preferences.dart';

class Redirect extends StatefulWidget {
  const Redirect({super.key});

  @override
  State<Redirect> createState() => _RedirectState();
}

class _RedirectState extends State<Redirect> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _autoSignIn();
  }

  Future<void> _autoSignIn() async {
    try {
      final email = await getStringValue(key: 'email');
      final password = await getStringValue(key: 'password');
      print('email $email password $password');
      await Authentication().signInWithEmailAndPassword(
          email: 'ibadkps@gmail.com', password: 'asd123');
    } catch (e) {
      // Handle sign-in errors gracefully
      print('Error during auto sign-in: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // Show a loading indicator while signing in
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return StreamBuilder(
      stream: Authentication().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for auth state
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
