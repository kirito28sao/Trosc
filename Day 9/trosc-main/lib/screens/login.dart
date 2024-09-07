import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/explain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/cubit/password_toggle.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Center(child: Text('Login')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            BlocProvider(
              create: (context) => PassCubit(),
              child: BlocBuilder<PassCubit, bool>(
                builder: (context, isPasswordVisible) {
                  return TextField(
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () =>
                            context.read<PassCubit>().toggleVisibility(),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Explain()),
                );
              },
              style: ElevatedButton.styleFrom(minimumSize: const Size(150, 50)),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
