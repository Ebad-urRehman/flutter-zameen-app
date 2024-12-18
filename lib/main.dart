import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zameen_flutter/files/auth/redirect.dart';
import 'package:zameen_flutter/files/detail%20view/details_screen.dart';
import 'package:zameen_flutter/files/login/login_screen.dart';
import 'package:zameen_flutter/files/login/sign_up.dart';
import 'package:zameen_flutter/files/login/splash_screen.dart';
import 'package:zameen_flutter/files/predictions/prediction_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zameen_flutter/theme_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAMfAvlIGujnaBhfMIZDuhFz5CZ7mXtNL8",
            authDomain: "zameen-app-aaf48.firebaseapp.com",
            projectId: "zameen-app-aaf48",
            storageBucket: "zameen-app-aaf48.firebasestorage.app",
            messagingSenderId: "377270064116",
            appId: "1:377270064116:web:1a97e6f5f1caa2da645fa1",
            measurementId: "G-610SLXSWGJ"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(ChangeNotifierProvider(
    create: (_) => ThemeManager(),
    child: const MyApp(),
  ));
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
        '/redirect': (context) => const Redirect(),
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
