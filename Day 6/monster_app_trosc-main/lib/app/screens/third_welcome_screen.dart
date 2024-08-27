import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moster_app/app/screens/login_screen.dart';
import 'package:moster_app/app/screens/sign_up_screen.dart';

import '../widgets/my_sized_box.dart';

class ThirdWelcomeScreen extends StatelessWidget {
  const ThirdWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  SvgPicture.asset(
                    'assets/images/pattern.svg',
                    width: 422,
                    height: 472,
                  ),
                  Positioned(
                    top: 49,
                    left: 7,
                    child: Image.asset(
                      'assets/images/illustration.png',
                      width: 375,
                      height: 416,
                    ),
                  ),
                ],
              ),
              const Text(
                'MONSTER LIVESCORE',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontFamily: 'Teko',
                  fontWeight: FontWeight.w600,
                ),
              ),
              // const SizedBox(height: 16),
              mySizedBox(height: 16),
              const SizedBox(
                width: 311,
                child: Text(
                  'We’d like to check that your preferences and details are accurate.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF808696),
                    fontSize: 14,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              // const SizedBox(height: 16),
              mySizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF8FE11),
                  fixedSize: const Size(311, 48),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xFF141414),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              mySizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignUpScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(311, 48),
                  backgroundColor: const Color(0xFF141414),
                  side: const BorderSide(color: Color(0xFFF8FE11)),
                ),
                child: const Text(
                  'Sign for Monster Livescore',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
