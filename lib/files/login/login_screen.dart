import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/constants/app_images.dart';
import 'package:zameen_flutter/files/auth/authentication.dart';
import 'package:zameen_flutter/files/home/home_page.dart';
import 'package:zameen_flutter/files/login/login_widgets.dart';
import 'package:zameen_flutter/theme_widget.dart';

AppImages appImages = AppImages();
var inputDecoration = InputWidgetDecoration();

// controllers

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);

    final TextEditingController controllerEmail = TextEditingController();
    final TextEditingController controllerPassword = TextEditingController();
    String? errorMessage = '';

    Future<void> signInWithEmailAndPassword() async {
      try {
        await Authentication().signInWithEmailAndPassword(
            email: controllerEmail.text, password: controllerPassword.text);
        Navigator.pushNamed(context, '/splashscreen');
        print('SUcessful');
      } on FirebaseAuthException catch (e) {
        setState(() {
          errorMessage = e.message;
          print(errorMessage);
        });
      }
    }

    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: themeProvider.currentTheme.primaryColor),
        title: 'Login',
        home: Scaffold(
            body: Stack(
          children: [
            const TopImage(),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  const ProfilePicture(),
                  const SizedBox(
                    height: 50,
                  ),
                  EmailInput(
                    controller: controllerEmail,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  PasswordInput(
                    controller: controllerPassword,
                  ),
                  const SizedBox(height: 2),
                  const RememberMeButton(),
                  const SizedBox(height: 25),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.6,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            signInWithEmailAndPassword();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                themeProvider.currentTheme.darkGreen,
                            foregroundColor: themeProvider.currentTheme.white,
                          ),
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                              fontFamily: 'Itim',
                              fontSize: 20,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(height: 3),
                  const SignUpDirect(),
                  ErrorMessage(errorMessage: errorMessage)
                ],
              ),
            )
          ],
        )));
  }
}
