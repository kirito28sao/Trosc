import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moster_app/app/screens/login_screen.dart';
import 'package:moster_app/app/widgets/my_container.dart';
import 'package:moster_app/app/widgets/my_sized_box.dart';
import 'package:moster_app/app/widgets/my_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: CircleAvatar(
                  backgroundColor: const Color(0xFF1F2022),
                  child: SvgPicture.asset(
                    'assets/icons/back.svg',
                    width: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontFamily: 'Teko',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Color(0xFF808696),
                          fontSize: 14,
                          letterSpacing: -0.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const LoginScreen();
                          }));
                        },
                        child: const Text(
                          ' Sign in',
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ),
                    ])
                  ],
                ),
              ),
              myTextField(
                label: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              mySizedBox(height: 24),
              myTextField(
                  label: 'Password',
                  textInputType: TextInputType.visiblePassword,
                  isPass: true,
                  con: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_off))),
              mySizedBox(height: 24),
              myTextField(label: 'Name', textInputType: TextInputType.name),
              mySizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF8FE11),
                    fixedSize: const Size(311, 48),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xFF141414),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              mySizedBox(height: 24),
              const Center(
                child: Text(
                  'Or sign up with',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF808797),
                  ),
                ),
              ),
              mySizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myContainer(
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/google.svg',
                        width: 24,
                      ),
                    ),
                  ),
                  mySizedBox(width: 16),
                  myContainer(
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/twitter.svg',
                        width: 24,
                      ),
                    ),
                  ),
                  mySizedBox(width: 16),
                  myContainer(
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/facebook.svg',
                        width: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
