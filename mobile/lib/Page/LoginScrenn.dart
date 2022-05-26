import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/Page/RegisterScrenn.dart';

bool isVisible = false;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Column(children: [
                              InputUsername(),
                              InputPassword(),
                            ]),
                          ),
                          Container(
                            height: 70,
                            padding: const EdgeInsets.only(
                                top: 30, left: 30, right: 30),
                            child: ElevatedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Login",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => xxx (),
                                //   ),
                                // );
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
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Or Connect Using",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 20),
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        const Color.fromARGB(255, 204, 22, 22),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    onPrimary: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                    ),
                                  ),
                                  icon: const Icon(
                                    FontAwesomeIcons.google,
                                    color: Colors.white,
                                  ),
                                  label: const Text("Google"),
                                  onPressed: () {},
                                ),
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color.fromARGB(255, 1, 3, 129),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPrimary: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                ),
                                icon: const Icon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.white,
                                ),
                                label: const Text("Facebook"),
                                onPressed: () {},
                              ),
                            ],
                          ),
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
            )));
  }

  Container SignupButton() {
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

  Padding InputUsername() {
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
                  decoration: const InputDecoration(
                    labelText: 'Username',
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

  Padding InputPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 5),
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
