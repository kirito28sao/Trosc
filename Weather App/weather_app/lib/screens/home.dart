import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20, left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.end,
                            '📍 : EG',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            'Ismailia',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        // Location

                        //ismailia

                        //  Sun Image
                        Image.asset(
                          'assets/images/6.png',
                          width: 300,
                        ),

                        // 28c
                        const Text(
                          '28°C',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),

                        // Clear
                        const Text(
                          'CLEAR',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),

                        // Date and Time
                        const Text(
                          'Thursday 08 • 8:44 PM',
                          style: TextStyle(
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
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sunrise',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '5:13 AM',
                                  style: TextStyle(
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
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sunset',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '6:39 PM',
                                  style: TextStyle(
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
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Temp Max',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '28°C',
                                  style: TextStyle(
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
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Temp Min',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '28°C',
                                  style: TextStyle(
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
                ),
              ],
            ),
          )),
    );
  }
}
