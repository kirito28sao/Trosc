import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/data/determine_position.dart';
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
      home: FutureBuilder(
          future: determinePosition(),
          builder: (context, snap) {
            if (snap.hasData) {
              return BlocProvider<WeatherBloc>(
                create: (context) =>
                    WeatherBloc()..add(FetchWeather(snap.data as Position)),
                child: const Home(),
              );
            } else {
              return Scaffold(
                // splash  screen
                body: FlutterSplashScreen.gif(
                  backgroundColor: const Color(0xFFF9B718),
                  gifPath: 'assets/images/splash.gif',
                  gifWidth: 300,
                  gifHeight: 600,
                  duration: const Duration(milliseconds: 5000),
                ),
              );
            }
          }),
    );
  }
}
