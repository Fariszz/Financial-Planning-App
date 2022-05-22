import 'package:flutter/material.dart';
import 'package:mobile/Page/RegisterPage.dart';

bool isVisible = false;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 194, 191, 191),
            body: Container(
              margin: EdgeInsets.all(10),
              child: ListView(
                children: [
                  Container(
                    child: Card(
                      color: Color.fromARGB(255, 240, 240, 240),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
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
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text(
                          //       "Welcome Back :)",
                          //       style: TextStyle(
                          //           fontSize: 22, fontWeight: FontWeight.w500),
                          //     ),
                          //   ],
                          // ),
                          // Container(
                          //   child: Column(children: [
                          //     InputUsername(),
                          //     InputPassword(),
                          //   ]),
                          // ),
                          Container(
                            height: 70,
                            padding:
                                EdgeInsets.only(top: 30, left: 30, right: 30),
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
                                //     builder: (context) => ListProduct(),
                                //   ),
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 77, 169,
                                      245), // Color ElevatedButton
                                  padding: EdgeInsets.symmetric(
                                      // Border Radius ElevatedBUtton
                                      horizontal: 40,
                                      vertical: 10),
                                  shape: StadiumBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                            ),
                            child: TextButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account?",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                ],
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return RegisterScreen();
                                }));
                              },
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
}

Container SignupButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: TextButton(
        child: Text(
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

  Padding InputPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
      child: Container(
        height: 65,
        child: Card(
          shadowColor: Color.fromARGB(255, 117, 115, 115),
          margin: EdgeInsets.only(
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
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: "Enter Your Password",
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

  Padding InputUsername() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
      child: Container(
        height: 65,
        child: Card(
          shadowColor: Color.fromARGB(255, 117, 115, 115),
          margin: EdgeInsets.only(
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
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: "Enter Your Username",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


