import 'package:flutter/material.dart';
import 'package:mobile/Page/LoginScrenn.dart';
import 'package:mobile/Page/RegisterPage.dart';
import 'package:mobile/Page/Test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', theme: ThemeData(), home: RegisterScreen());
  }
}
