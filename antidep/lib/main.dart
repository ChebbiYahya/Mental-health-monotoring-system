import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:antidep/diagnostic_screen.dart/HomePage.dart';
import 'package:antidep/resultat.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anti Dep',
      home: AnimatedSplashScreen(
        backgroundColor: Color(0xFF199A8E),
        splash: Image.asset(
          "assets/logo1.png",
        ),
        splashIconSize: 400,
        duration: 1000,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: Homepage(),
      ),
    );
  }
}
