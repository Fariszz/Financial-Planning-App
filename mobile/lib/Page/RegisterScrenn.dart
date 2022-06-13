import 'package:flutter/material.dart';
import 'package:mobile/Page/LoginScrenn.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/Widgets/loading_Button.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:provider/provider.dart';

bool isVisible = false;
bool isVisible2 = false;
bool isLoading = false;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController password_confirmationController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      if (await authProvider.register(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          password_confirmation: password_confirmationController.text)) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color.fromARGB(255, 243, 114, 104),
          content: Text(
            'Gagal Register',
            textAlign: TextAlign.center,
          ),
        ));
      }
      print(nameController.text);
      print(emailController.text);
      print(passwordController.text);
      print(password_confirmationController.text);
    }

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
                          SignUpButton(),
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
                            child: TextButton(
                              onPressed: handleSignUp,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff7F3DFF),
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

  SignUpButton() {
    return Row(
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
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }

  InputUsername() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 20, bottom: 10),
      child: Container(
        height: 60,
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
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputEmail() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 20),
      child: Container(
        height: 60,
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
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputPassword(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 20),
      child: Container(
        height: 60,
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
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: label,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  ReInputPassword(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 20),
      child: Container(
        height: 60,
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
                TextFormField(
                  controller: password_confirmationController,
                  decoration: InputDecoration(
                    labelText: label,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                          isVisible2 ? Icons.visibility : Icons.visibility_off),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  SigninButton() {
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
}
