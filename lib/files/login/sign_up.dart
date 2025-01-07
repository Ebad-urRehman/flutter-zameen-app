import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/files/auth/authentication.dart';
import 'package:zameen_flutter/files/fire_store_db/file_store_service.dart';
import 'package:zameen_flutter/files/login/login_screen.dart';
import 'package:zameen_flutter/files/login/login_widgets.dart';
import 'package:zameen_flutter/files/store%20data/manage_share_preferences.dart';
import 'package:zameen_flutter/theme_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);

    final TextEditingController controllerEmail = TextEditingController();
    final TextEditingController controllerUserName = TextEditingController();
    final TextEditingController controllerPassword1 = TextEditingController();
    final TextEditingController controllerPassword2 = TextEditingController();
    String? errorMessage = '';

    Future<void> createUserWithEmailAndPassword() async {
      try {
        await Authentication().createUserWithEmailAndPassword(
            email: controllerEmail.text, password: controllerPassword1.text);
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
            scaffoldBackgroundColor:
                themeProvider.currentTheme.signUpBackground),
        title: 'Sign up',
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                'Sign Up',
                style: TextStyle(
                    fontFamily: 'Itim',
                    color: themeProvider.currentTheme.white,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: themeProvider.currentTheme.primaryColor,
            ),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        const Text(
                          'Create New Account',
                          style: TextStyle(
                            fontFamily: 'Itim',
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            controller: controllerUserName,
                            decoration: inputDecoration.decoration(
                                labelText: 'User Name',
                                fontFamily: 'Itim',
                                color: Colors.black,
                                borderRadius: 8.0,
                                icon: const Icon(Icons.mail),
                                fillColor:
                                    themeProvider.currentTheme.secondaryColor,
                                focusedColor: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            controller: controllerEmail,
                            decoration: inputDecoration.decoration(
                                labelText: 'Email',
                                fontFamily: 'Itim',
                                color: Colors.black,
                                borderRadius: 8.0,
                                icon: const Icon(Icons.mail),
                                fillColor:
                                    themeProvider.currentTheme.secondaryColor,
                                focusedColor: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            controller: controllerPassword1,
                            decoration: inputDecoration.decoration(
                                labelText: 'Password',
                                fontFamily: 'Itim',
                                color: Colors.black,
                                borderRadius: 8.0,
                                icon: Icon(Icons.lock),
                                fillColor:
                                    themeProvider.currentTheme.secondaryColor,
                                focusedColor: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            controller: controllerPassword2,
                            decoration: inputDecoration.decoration(
                                labelText: 'Confirm Password',
                                fontFamily: 'Itim',
                                color: Colors.black,
                                borderRadius: 8.0,
                                icon: Icon(Icons.mail),
                                fillColor:
                                    themeProvider.currentTheme.secondaryColor,
                                focusedColor: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.6,
                            height: 40,
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (controllerPassword1.text ==
                                      controllerPassword2.text) {
                                    await createUserWithEmailAndPassword();
                                    String uid =
                                        Authentication().currentUser!.uid;
                                    await storeUserData(
                                        uid: uid,
                                        email: controllerEmail.text,
                                        userName: controllerUserName.text);
                                    addStringValue(
                                        key: 'username',
                                        value: controllerUserName.text);
                                  } else {
                                    setState(() {
                                      errorMessage = 'Passwords donot match';
                                      print(errorMessage);
                                    });
                                  }
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const LoginScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      themeProvider.currentTheme.darkGreen,
                                  foregroundColor:
                                      themeProvider.currentTheme.white,
                                ),
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontFamily: 'Itim',
                                    fontSize: 20,
                                  ),
                                )),
                          ),
                        ),
                        const SizedBox(height: 3),
                        RichText(
                            text: TextSpan(children: [
                          const TextSpan(
                              text: "Already signed up!  ",
                              style: TextStyle(
                                  fontFamily: 'Itim',
                                  fontSize: 16,
                                  color: Colors.black)),
                          TextSpan(
                              text: "Log In",
                              style: const TextStyle(
                                fontFamily: 'Itim',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                })
                        ])),
                        ErrorMessage(errorMessage: errorMessage)
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
