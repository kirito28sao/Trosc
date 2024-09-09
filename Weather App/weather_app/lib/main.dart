import 'package:flutter/material.dart';
import 'package:weather_app/screens/home.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterSplashScreen.gif(
        backgroundColor: const Color(0xFFF9B718),
        gifPath: 'assets/images/splash.gif',
        gifWidth: 300,
        gifHeight: 600,
        nextScreen: const Home(),
        duration: const Duration(milliseconds: 3515),
      ),
    );
  }
}
