import 'package:flutter/material.dart';

class HomeScrenn extends StatefulWidget {
  const HomeScrenn({Key? key}) : super(key: key);

  @override
  State<HomeScrenn> createState() => _HomeScrennState();
}

class _HomeScrennState extends State<HomeScrenn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            // color: Colors.amber,
            padding: const EdgeInsets.only(
              top: 30,
              left: 10,
              right: 20,
              bottom: 40,
            ),
            child: const Text(
              "Sign in",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
