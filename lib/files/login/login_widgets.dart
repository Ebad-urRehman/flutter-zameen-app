import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/constants/app_colors.dart';
import 'package:zameen_flutter/constants/app_images.dart';
import 'package:zameen_flutter/files/home/home_page.dart';
import 'package:zameen_flutter/files/login/sign_up.dart';
import 'package:zameen_flutter/files/login/splash_screen.dart';
import 'package:zameen_flutter/theme_widget.dart';

AppColors appColors = AppColors();
AppImages appImages = AppImages();

class InputWidgetDecoration {
  var decoration = (
      {labelText,
      fontFamily,
      color,
      icon,
      borderRadius,
      fillColor,
      focusedColor}) {
    return InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontFamily: fontFamily, color: color),
        prefixIcon: icon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius as double)),
        filled: true,
        fillColor: fillColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius as double),
          borderSide: BorderSide(
            color:
                focusedColor, // Outline color when the field is focused (active)
          ),
        ));
  };
}

class TopImage extends StatelessWidget {
  const TopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(appImages.topLoginImage), fit: BoxFit.cover)),
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return CircleAvatar(
      backgroundColor: themeProvider.currentTheme.white,
      radius: 75,
      backgroundImage: AssetImage(appImages.roomImage),
    );
  }
}

class EmailInput extends StatelessWidget {
  TextEditingController controller;
  EmailInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.3,
      child: TextFormField(
        controller: controller,
        decoration: inputDecoration.decoration(
            labelText: 'Email',
            fontFamily: 'Itim',
            color: Colors.black,
            borderRadius: 8.0,
            icon: const Icon(Icons.mail),
            fillColor: themeProvider.currentTheme.secondaryColor,
            focusedColor: Colors.black),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  TextEditingController controller;

  PasswordInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.3,
      child: TextFormField(
        controller: controller,
        obscureText: true,
        decoration: inputDecoration.decoration(
            labelText: 'Password',
            fontFamily: 'Itim',
            color: Colors.black,
            borderRadius: 8.0,
            icon: const Icon(Icons.lock),
            fillColor: themeProvider.currentTheme.secondaryColor,
            focusedColor: Colors.black),
      ),
    );
  }
}

class RememberMeButton extends StatelessWidget {
  const RememberMeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        child: Row(
          children: [
            Text(
              'Remember Me ✔️',
              style: TextStyle(
                fontFamily: 'Itim',
                fontSize: 16,
                color: themeProvider.currentTheme.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.6,
        height: 40,
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: themeProvider.currentTheme.darkGreen,
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
    );
  }
}

class SignUpDirect extends StatelessWidget {
  const SignUpDirect({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "Don'ts have and account  ",
          style: TextStyle(
              fontFamily: 'Itim',
              fontSize: 16,
              color: themeProvider.currentTheme.white)),
      TextSpan(
          text: "Sign up",
          style: TextStyle(
            fontFamily: 'Itim',
            fontSize: 16,
            color: themeProvider.currentTheme.white,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUp()));
            })
    ]));
  }
}

class ErrorMessage extends StatefulWidget {
  String? errorMessage;
  ErrorMessage({super.key, required this.errorMessage});

  @override
  State<ErrorMessage> createState() => _ErrorMessageState();
}

class _ErrorMessageState extends State<ErrorMessage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        widget.errorMessage.toString(),
        style: const TextStyle(
            color: Colors.red, fontFamily: 'Itim', fontSize: 25),
      ),
    );
  }
}
