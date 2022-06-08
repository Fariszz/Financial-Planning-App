import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:mobile/Page/InputHutang.dart';
import 'package:mobile/Page/InputTabungan.dart';
import 'package:mobile/Page/LoginScrenn.dart';
import 'package:mobile/Page/RegisterScrenn.dart';
import 'package:mobile/Page/CategoryScrenn.dart';
import 'package:mobile/Page/profile.dart';
import 'package:mobile/Page/trans.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => InputHutang(),
          '/register': (context) => RegisterScreen(),
          '/trans': (context) => Transaction(),
          '/home': (context) => Profile(),
        },
      ),
    );
  }
}
