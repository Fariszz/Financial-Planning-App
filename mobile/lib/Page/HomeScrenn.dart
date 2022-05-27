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
          title: Text('Home'),
        ),
      ),
    );
  }
}
