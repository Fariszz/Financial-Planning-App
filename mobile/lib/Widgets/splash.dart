import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/Page/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // Image(
          //   image: AssetImage(
          //     'assets/images/splash.jpeg',
          //   ),
          // ),
        ],
      ),
    );
  }
}
