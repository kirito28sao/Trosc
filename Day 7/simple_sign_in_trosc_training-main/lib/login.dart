import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/forget_screen.dart';
import 'package:login_ui/sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

// علشان اسهل عليك وربنا يكون في عونك

// دي ارقام السطور الي حالل فيها التاسك وكاتب عندها كومنت

// 26 , 62 , 84 , 90 , 99 , 110 , 123 , 141 , 160 , 189

class _LoginState extends State<Login> {
  bool obscureText = true;

// for validation
  final _key = GlobalKey<FormState>();
  final _emailCont = TextEditingController();
  final _passCont = TextEditingController();
  final String _emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          image: AssetImage("assets/back_ui.png"),
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: Container(
            width: 320,
            height: 500,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 217, 223, 204),
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(195, 0, 0, 0),
                    spreadRadius: 12,
                    blurRadius: 12,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,

                // I used form to validate the whole form pass and email
                body: Form(
                  key: _key,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/logo_ui.png"),
                          Text(
                            "Sign in",
                            style: GoogleFonts.jomolhari(fontSize: 32),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 37,
                      ),
                      TextFormField(
                        // controller and validator for email
                        controller: _emailCont,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'its empty !';
                          }
                          // regex
                          RegExp regex = RegExp(_emailPattern);
                          if (!regex.hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(

                            // i used content padding to control field height
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10.0),
                            border: OutlineInputBorder(),
                            labelText: "email",
                            hintText: "AhmedWael@example.com"),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        // controller and validator for password
                        controller: _passCont,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 8) {
                            return 'Password is to short';
                          }
                          return null;
                        },
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          // same here
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10.0),
                          border: const OutlineInputBorder(),
                          labelText: "password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              icon: Icon(obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        // i used this way to make forget pass clickable
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ForScreen();
                              }));
                            },
                            child: const Text(
                              'forget password',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // on click check the valids :)
                          if (_key.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Form is ok :)')));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            fixedSize: const Size(150, 60)),
                        child: const Text(
                          'sign in',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'create account',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 10),
                            ),
                            // and here too
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const SignUp();
                                  }));
                                },
                                child: const Text(
                                  'sign up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                )),
                          ])
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _emailCont.dispose();
    _passCont.dispose();
    super.dispose();
  }
}

//another way to add background image

// home: Scaffold(
//   appBar: AppBar(
//       title: Text('Set Background Image'),
//   ),
//   body: DecoratedBox(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("images/img.png"), fit: BoxFit.cover),
//           ),
//           child: Center(
//               child: FlutterLogo(
//             size: 200,
//           )),
//         ),
// ),
