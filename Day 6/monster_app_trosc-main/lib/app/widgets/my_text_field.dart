import 'package:flutter/material.dart';

Widget myTextField(
    {required String? label,
    required TextInputType? textInputType,
    bool isPass = false,
    IconButton? con}) {
  return TextFormField(
    obscureText: isPass,
    cursorColor: const Color(0xFFF8FE11),
    keyboardType: textInputType,
    style: const TextStyle(
      color: Colors.white,
    ),
    decoration: InputDecoration(
      suffixIcon: con,
      labelText: label!,
      labelStyle: const TextStyle(
        color: Color(0xFF808696),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFF8FE11),
        ),
      ),
    ),
  );
}
