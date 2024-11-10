import 'package:flutter/material.dart';
import 'package:zameen_flutter/files/detail%20view/details_screen.dart';
import 'package:zameen_flutter/files/login/login_screen.dart';
import 'package:zameen_flutter/files/login/sign_up.dart';
import 'package:zameen_flutter/files/login/splash_screen.dart';
import 'package:zameen_flutter/files/predictions/prediction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/splashscreen',
      routes: {
        '/splashscreen': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUp(),
        '/details': (context) => const DetailsScreen(),
        '/pricepredictor': (context) => const PricePredictorPage(),
        '/browseestates': (context) => const PricePredictorPage(),
      },
      // home: Column(children: [Expanded(child: HomePage())]),
    );
  }
}
