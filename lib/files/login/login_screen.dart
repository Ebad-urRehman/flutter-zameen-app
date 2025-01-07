import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/constants/app_images.dart';
import 'package:zameen_flutter/files/auth/authentication.dart';
import 'package:zameen_flutter/files/login/login_widgets.dart';
import 'package:zameen_flutter/files/store%20data/manage_share_preferences.dart';
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
  String? errorMessage = '';
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);

    Future<void> signInWithEmailAndPassword() async {
      try {
        await Authentication().signInWithEmailAndPassword(
            email: controllerEmail.text, password: controllerPassword.text);
        addStringValue(key: 'email', value: controllerEmail.text);
        addStringValue(key: 'password', value: controllerPassword.text);
        Navigator.pushNamed(context, '/splashscreen');
        print('Sucessful');
      } on FirebaseAuthException catch (e) {
        setState(() {
          errorMessage = e.message;
          print(errorMessage);
        });
      }
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: themeProvider.currentTheme.primaryColor),
        title: 'Login',
        home: Scaffold(
            body: SingleChildScrollView(
          child: Stack(
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
                              if (controllerEmail.text != '' &&
                                  controllerPassword.text != '') {
                                signInWithEmailAndPassword();
                              } else {
                                setState(() {
                                  errorMessage =
                                      "Can't login without email or password";
                                });
                              }
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
          ),
        )));
  }
}
