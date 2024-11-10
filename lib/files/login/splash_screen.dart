import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zameen_flutter/constants/app_colors.dart';
import 'package:zameen_flutter/constants/app_images.dart';
import 'package:zameen_flutter/files/login/widgets.dart';

AppImages appImages = AppImages();
AppColors appColors = AppColors();
var inputDecoration = InputWidgetDecoration();

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: appColors.primaryColor),
        title: 'Welcome',
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
                    height: 140,
                  ),
                  CircleAvatar(
                    backgroundColor: appColors.white,
                    radius: 75,
                    backgroundImage: const AssetImage('room_image_2.png'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Welcome to the App!',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      color: appColors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ],
        )));
  }
}
