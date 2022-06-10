import 'package:flutter/material.dart';

import 'package:mobile/Page/LoginScrenn.dart';
import 'package:mobile/Page/pages.dart';
import 'package:mobile/Page/stats.dart';
import 'package:mobile/Page/trans.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import 'Page/RegisterScrenn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        ));
  }
}
