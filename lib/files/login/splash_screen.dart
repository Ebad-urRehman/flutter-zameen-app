import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/constants/app_images.dart';
import 'package:zameen_flutter/files/login/login_widgets.dart';
import 'package:zameen_flutter/theme_widget.dart';

AppImages appImages = AppImages();
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
        Navigator.pushNamed(context, '/redirect');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeManager>(context);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: themeProvider.currentTheme.primaryColor),
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
                    backgroundColor: themeProvider.currentTheme.white,
                    radius: 75,
                    backgroundImage: AssetImage((appImages.roomImage)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Welcome to the App!',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      color: themeProvider.currentTheme.white,
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
