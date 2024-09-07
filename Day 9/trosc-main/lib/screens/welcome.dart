import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    // Navigate to SecondScreen after 3 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset('assets/images/cloud.png'),
                  const Text(
                    'Points Counter',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 40, fontFamily: 'Pacifico'),
              ),
              const CircularProgressIndicator(
                color: Colors.white,
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
