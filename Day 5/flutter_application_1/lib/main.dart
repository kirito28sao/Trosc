import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_field.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static const IconData addBoxOutlined =
      IconData(0xee3c, fontFamily: 'MaterialIcons'); // box icon in app bar

  static const IconData search =
      IconData(0xe567, fontFamily: 'MaterialIcons'); // search icon

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 85, 145, 173),
        appBar: AppBar(
            //////////////////////app bar///////////////////
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  search,
                ),
              )
            ],
            title: const Center(
                child: Text(
              "Home",
              style: TextStyle(fontFamily: "big_noodle_titling", fontSize: 30),
            )),
            leading: const Icon(addBoxOutlined),
            backgroundColor: Colors.lightBlueAccent),
        /////////////////////body///////////////////////////
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Spacer(
                flex: 1,
              ),
              ////////////////////////image///////////////////////
              Image(
                image: AssetImage('Images/Asset 1.png'),
                width: 200,
                height: 200,
              ),
              ///////////////////////text/////////////////////////////
              Padding(
                padding: EdgeInsets.symmetric(vertical: 22),
                child: Text(
                  "Welcome Again",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: "Pacifico",
                  ),
                ),
              ),
              //////////////////text field //////////////////////
              CustomTextField(
                hint: 'Name',
              ),
              Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
