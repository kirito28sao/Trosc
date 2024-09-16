// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.cityController,
  });

  final TextEditingController cityController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.text,
      controller: cityController,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 9),
          hintText: "Search",
          hintStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)))),
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          context.read<WeatherBloc>().add(SearchWeather(value));
        }
      },
    );
  }
}
