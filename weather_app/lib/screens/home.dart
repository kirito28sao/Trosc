import 'package:flutter/material.dart';

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
          backgroundColor: Colors.blueGrey,
          body: Column(
            children: [
              // Location
              const Padding(
                padding: EdgeInsets.only(top: 15, left: 35),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.red),
                    Text(
                      ' : EG',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              //ismailia
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
          )),
    );
  }
}
