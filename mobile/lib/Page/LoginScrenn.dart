import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/Page/RegisterScrenn.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/providers/auth_provider.dart';
import 'package:mobile/providers/harta_provider.dart';
import 'package:provider/provider.dart';

bool isVisible = false;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Login Berhasil',
            // textAlign: TextAlign.center,
          ),
          backgroundColor: Color.fromARGB(255, 94, 202, 98),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ));
        Navigator.popAndPushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Email atau Password Salah ',
            // textAlign: TextAlign.center,
          ),
          backgroundColor: Color.fromARGB(255, 241, 76, 64),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 1),
        ));
      }
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
                  color: const Color.fromARGB(255, 240, 240, 240),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  elevation: 5,
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
                              "Sign in",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Column(children: [
                          InputEmail(),
                          InputPassword(),
                        ]),
                      ),
                      Container(
                        height: 70,
                        padding:
                            const EdgeInsets.only(top: 30, left: 30, right: 30),
                        child: TextButton(
                          onPressed: handleSignIn,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Sign In",
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
                      const SizedBox(
                        height: 20,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: const [
                      //     Text(
                      //       "Or Connect Using",
                      //       style: TextStyle(fontSize: 12),
                      //     )
                      //   ],
                      // ),
                      const SizedBox(
                        height: 5,
                      ),
                      // Row(
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 30, right: 20),
                      //       child: ElevatedButton.icon(
                      //         style: ElevatedButton.styleFrom(
                      //           primary: const Color.fromARGB(255, 204, 22, 22),
                      //           shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(10)),
                      //           onPrimary: Colors.white,
                      //           padding: const EdgeInsets.symmetric(
                      //             horizontal: 35,
                      //           ),
                      //         ),
                      //         icon: const Icon(
                      //           FontAwesomeIcons.google,
                      //           color: Colors.white,
                      //         ),
                      //         label: const Text("Google"),
                      //         onPressed: () {},
                      //       ),
                      //     ),
                      //     ElevatedButton.icon(
                      //       style: ElevatedButton.styleFrom(
                      //         primary: const Color.fromARGB(255, 1, 3, 129),
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(10)),
                      //         onPrimary: Colors.white,
                      //         padding: const EdgeInsets.symmetric(
                      //           horizontal: 30,
                      //         ),
                      //       ),
                      //       icon: const Icon(
                      //         FontAwesomeIcons.facebook,
                      //         color: Colors.white,
                      //       ),
                      //       label: const Text("Facebook"),
                      //       onPressed: () {},
                      //     ),
                      //   ],
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: const [
                                Text("Don't have an account?",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SignupButton(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SignupButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: TextButton(
        child: const Text(
          "Sign up",
          style: TextStyle(fontSize: 13),
        ),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return RegisterScreen();
          }));
        },
      ),
    );
  }

  InputEmail() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
      child: Container(
        height: 60,
        child: Card(
          shadowColor: const Color.fromARGB(255, 117, 115, 115),
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
                    icon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
      child: Container(
        height: 60,
        child: Card(
          shadowColor: const Color.fromARGB(255, 117, 115, 115),
          margin: const EdgeInsets.only(
            left: 10,
            right: 20,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: Column(
              children: [
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    icon: const Icon(
                      Icons.lock_outline,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !isVisible,
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
