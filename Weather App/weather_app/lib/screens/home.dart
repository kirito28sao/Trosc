// ignore_for_file: sized_box_for_whitespace

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/data/weather_icon.dart';
import 'package:weather_app/widgets/search_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,

            // background
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(3, -0.3),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-3, -0.3),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1.2),
                  child: Container(
                    height: 300,
                    width: 400,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFAB40),
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 100,
                    sigmaY: 100,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                  ),
                ),

                //bloc consumer
                BlocConsumer<WeatherBloc, WeatherState>(
                    listener: (context, state) {
                  if (state is WeatherSuccess || state is WeatherFailure) {
                    cityController
                        .clear(); // Clear the search field when state changes
                  }
                  if (state is WeatherFailure) {
                    //error message using SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.errorMessage, // Show error message
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }, builder: (context, state) {
                  if (state is WeatherLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is WeatherSuccess) {
                    // ui body
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            BlocBuilder<WeatherBloc, WeatherState>(
                              builder: (context, state) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    right: 25,
                                    left: 25,
                                    bottom: 10,
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //search field
                                        Container(
                                          height: 50,
                                          child: SearchField(
                                              cityController: cityController),
                                        ),
                                        if (state is WeatherFailure) ...[
                                          const SizedBox(height: 20),
                                          Text(
                                            state.errorMessage,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ]
                                      ]),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              // location column
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //country name
                                  Text(
                                    textAlign: TextAlign.end,
                                    '📍 : ${state.weather.country}',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  //area name
                                  Text(
                                    '${state.weather.areaName}',
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),

                        //icon and weather column
                        Column(
                          children: [
                            //  weather icon
                            WeatherIcon(
                                code: state.weather.weatherConditionCode!),

                            // weather degree
                            Text(
                              '${state.weather.temperature?.celsius?.round()}°C',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),

                            // weather condition
                            Text(
                              state.weather.weatherMain!.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),

                            // Date and Time
                            Text(
                              DateFormat('EEEE dd •')
                                  .add_jm()
                                  .format(state.weather.date!),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Sunrise and Sunset Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Spacer(
                                  flex: 1,
                                ),
                                Image.asset(
                                  'assets/images/11.png',
                                  width: 50,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),

                                // Sunrise Info
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Sunrise',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      ' ${DateFormat().add_jm().format(state.weather.sunrise!)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(
                                  flex: 2,
                                ),
                                Image.asset(
                                  'assets/images/12.png',
                                  width: 50,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),

                                //Sunset Info
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Sunset',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      DateFormat()
                                          .add_jm()
                                          .format(state.weather.sunset!),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),

                            // The Line
                            const Divider(
                              color: Colors.white,
                              thickness: 1,
                              indent: 40,
                              endIndent: 30,
                            ),
                            const SizedBox(height: 5),

                            // Max and Min Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Spacer(
                                  flex: 1,
                                ),
                                Image.asset(
                                  'assets/images/13.png',
                                  width: 50,
                                ),

                                // Max Info
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Temp Max',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '${state.weather.tempMax?.celsius?.round()}°C',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(
                                  flex: 2,
                                ),
                                Image.asset('assets/images/14.png', width: 50),

                                // Min Info
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Temp Min',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '${state.weather.tempMin?.celsius?.round()}°C',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(
                                  flex: 1,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  } else if (state is WeatherFailure) {
                    // error (city not found)
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error, color: Colors.red, size: 80),
                          const SizedBox(height: 20),
                          const Text(
                            'City not found!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 10),
                          //search field
                          Container(
                            width: 350,
                            child: SearchField(cityController: cityController),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ],
            ),
          )),
    );
  }
}
