import 'package:flutter/material.dart';

class ForScreen extends StatelessWidget {
  const ForScreen({super.key});
// forget pass screen
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "forget pass",
        style: TextStyle(color: Colors.black),
      )),
    );
  }
}
