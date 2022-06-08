import 'package:flutter/material.dart';
import 'package:mobile/Page/HomeScrenn.dart';
import 'package:mobile/Page/InputMoneyScreen.dart';
import 'package:mobile/Page/InputTabungan.dart';
import 'package:mobile/Page/LoginScrenn.dart';
import 'package:mobile/Page/stats.dart';
import 'package:mobile/Page/trans.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Home(),

    );
  }
}
