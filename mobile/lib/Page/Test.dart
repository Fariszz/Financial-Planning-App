import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);
  final String url = 'http://localhost:10.0.2.2/api/v1/register';

  getRegister() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
