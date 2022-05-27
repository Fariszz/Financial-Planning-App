import 'package:flutter/material.dart';
import 'package:mobile/Page/HomeScrenn.dart';
import 'package:mobile/Page/LoginScrenn.dart';
import 'package:mobile/Page/RegisterScrenn.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:provider/provider.dart';

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
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/home': (context) => HomeScrenn(),
        },
      ),
    );
  }
}
