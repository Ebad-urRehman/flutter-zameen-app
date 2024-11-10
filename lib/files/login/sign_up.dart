import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zameen_flutter/files/login/login_screen.dart';
import 'package:zameen_flutter/constants/app_colors.dart';

AppColors appColors = AppColors();

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: appColors.white),
        title: 'Sign up',
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                'Sign Up',
                style: TextStyle(
                    fontFamily: 'Itim',
                    color: appColors.white,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: appColors.primaryColor,
            ),
            body: Stack(
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
                          decoration: inputDecoration.decoration(
                              labelText: 'User Name',
                              fontFamily: 'Itim',
                              color: Colors.black,
                              borderRadius: 8,
                              icon: Icon(Icons.mail),
                              fillColor: appColors.secondaryColor,
                              focusedColor: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                          decoration: inputDecoration.decoration(
                              labelText: 'Email',
                              fontFamily: 'Itim',
                              color: Colors.black,
                              borderRadius: 8,
                              icon: Icon(Icons.mail),
                              fillColor: appColors.secondaryColor,
                              focusedColor: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                          decoration: inputDecoration.decoration(
                              labelText: 'Password',
                              fontFamily: 'Itim',
                              color: Colors.black,
                              borderRadius: 8,
                              icon: Icon(Icons.lock),
                              fillColor: appColors.secondaryColor,
                              focusedColor: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                          decoration: inputDecoration.decoration(
                              labelText: 'Confirm Password',
                              fontFamily: 'Itim',
                              color: Colors.black,
                              borderRadius: 8,
                              icon: Icon(Icons.mail),
                              fillColor: appColors.secondaryColor,
                              focusedColor: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.6,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: appColors.darkGreen,
                                foregroundColor: appColors.white,
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
                      ]))
                    ],
                  ),
                )
              ],
            )));
  }
}
