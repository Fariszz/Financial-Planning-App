import 'package:flutter/material.dart';
import 'package:mobile/Page/LoginScrenn.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

bool isVisible = false;
bool isVisible2 = false;

final TextEditingController passwordController = TextEditingController();

String password = "";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  final String url = 'http://localhost:10.0.2.2/api/v1/register';

  getRegister() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  register() {
    var dataRegister = {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "confirmPassword": confirmPasswordController.text
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 194, 191, 191),
            body: Container(
              // margin: EdgeInsets.all(10),
              child: ListView(
                children: [
                  Container(
                    child: Card(
                      color: Color.fromARGB(255, 240, 240, 240),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      elevation: 10, // Shaddow card
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Icon(
                                  Icons.account_circle_sharp,
                                  size: 60,
                                ),
                              ),
                              Container(
                                // color: Colors.amber,
                                padding: const EdgeInsets.only(
                                  top: 30,
                                  left: 10,
                                  right: 20,
                                  bottom: 40,
                                ),
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Column(children: [
                              InputUsername(),
                              InputEmail(),
                              InputPassword("Password"),
                              ReInputPassword("Confirm Password"),
                            ]),
                          ),
                          Container(
                            height: 70,
                            padding: const EdgeInsets.only(
                                top: 20, left: 30, right: 30),
                            child: ElevatedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Register",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return const LoginScreen();
                                  },
                                ));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPrimary: Colors.black,
                                minimumSize: const Size(double.infinity, 50),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Already have acoount?",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          SigninButton(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }

  Container SigninButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: TextButton(
        child: const Text(
          "Sign in",
          style: TextStyle(fontSize: 13),
        ),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const LoginScreen();
          }));
        },
      ),
    );
  }

  Padding InputUsername() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      child: Container(
        height: 55,
        child: Card(
          shadowColor: Color.fromARGB(255, 117, 115, 115),
          margin: const EdgeInsets.only(
            left: 10,
            right: 20,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Column(
              children: [
                Container(
                  height: 45,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Username',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 13)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding InputEmail() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 20),
      child: Container(
        height: 55,
        child: Card(
          shadowColor: Color.fromARGB(255, 117, 115, 115),
          margin: const EdgeInsets.only(
            left: 10,
            right: 20,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Container(
                  height: 45,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 13)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding InputPassword(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 20),
      child: Container(
        height: 55,
        child: Card(
          shadowColor: Color.fromARGB(255, 117, 115, 115),
          margin: const EdgeInsets.only(
            left: 10,
            right: 20,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Container(
                  height: 45,
                  child: TextFormField(
                    // controller: passwordController,
                    decoration: InputDecoration(
                      labelText: label,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintStyle: const TextStyle(fontSize: 13),
                      suffixIcon: IconButton(
                        icon: Icon(isVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(
                            () {
                              isVisible = !isVisible;
                            },
                          );
                        },
                      ),
                    ),
                    obscureText: !isVisible,
                    keyboardType: TextInputType.text,

                    // onSaved: (str) {
                    //   password = str.toString();
                    // }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding ReInputPassword(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 20),
      child: Container(
        height: 55,
        child: Card(
          shadowColor: Color.fromARGB(255, 117, 115, 115),
          margin: const EdgeInsets.only(
            left: 10,
            right: 20,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Container(
                  height: 45,
                  child: TextFormField(
                    // controller: passwordController2,
                    decoration: InputDecoration(
                      labelText: label,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintStyle: const TextStyle(fontSize: 13),
                      suffixIcon: IconButton(
                        icon: Icon(isVisible2
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(
                            () {
                              isVisible2 = !isVisible2;
                            },
                          );
                        },
                      ),
                    ),
                    obscureText: !isVisible2,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
