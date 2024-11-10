import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zameen_flutter/constants/app_colors.dart';
import 'package:zameen_flutter/constants/app_images.dart';
import 'package:zameen_flutter/files/home/home_page.dart';
import 'package:zameen_flutter/files/login/sign_up.dart';
import 'package:zameen_flutter/files/login/widgets.dart';

AppImages appImages = AppImages();
AppColors appColors = AppColors();
var inputDecoration = InputWidgetDecoration();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: appColors.primaryColor),
        title: 'Login',
        home: Scaffold(
            body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(appImages.topLoginImage),
                        fit: BoxFit.cover)),
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  CircleAvatar(
                    backgroundColor: appColors.white,
                    radius: 75,
                    backgroundImage: const AssetImage('room_image_2.png'),
                  ),
                  const SizedBox(
                    height: 50,
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
                    height: 35,
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
                  const SizedBox(height: 2),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Row(
                        children: [
                          Text(
                            'Remember Me',
                            style: TextStyle(
                              fontFamily: 'Itim',
                              fontSize: 16,
                              color: appColors.white,
                            ),
                          )
                        ],
                      ),
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
                                    builder: (context) => const HomePage()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appColors.darkGreen,
                            foregroundColor: appColors.white,
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
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Don'ts have and account  ",
                        style: TextStyle(
                            fontFamily: 'Itim',
                            fontSize: 16,
                            color: appColors.white)),
                    TextSpan(
                        text: "Sign up",
                        style: TextStyle(
                          fontFamily: 'Itim',
                          fontSize: 16,
                          color: appColors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          })
                  ]))
                ],
              ),
            )
          ],
        )));
  }
}
