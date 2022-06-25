import 'package:flutter/material.dart';
import 'package:mobile/Page/RichesPage.dart';
import 'package:mobile/Page/LoginScrenn.dart';

import 'package:mobile/Page/home_test.dart';
import 'package:mobile/Page/pages.dart';
// import 'package:mobile/Page/stats.dart';
import 'package:mobile/Page/trans.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:mobile/providers/harta_provider.dart';
import 'package:mobile/providers/hutang_provider.dart';
import 'package:mobile/providers/ideal_budgets_provider.dart';
import 'package:mobile/providers/input_expend_provider.dart';
import 'package:mobile/providers/input_harta_provider.dart';
import 'package:mobile/providers/input_hutang_provider.dart';
import 'package:mobile/providers/input_ideal_provider.dart';
import 'package:mobile/providers/input_pendapatan_provider.dart';
import 'package:mobile/providers/input_provider.dart';
import 'package:mobile/providers/pendapatan_provider.dart';
import 'package:mobile/providers/pengeluaran_provider.dart';
import 'package:mobile/providers/total_pendapatan_provider.dart';
import 'package:provider/provider.dart';
import 'Page/CheckWallet.dart';
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
          ChangeNotifierProvider(create: (context) => InputProvider()),
          ChangeNotifierProvider(create: (context) => HartaProvider()),
          ChangeNotifierProvider(create: (context) => HutangProvider()),
          ChangeNotifierProvider(create: (context) => PendapatanProvider()),
          ChangeNotifierProvider(create: (context) => PengeluaranProvider()),
          ChangeNotifierProvider(create: (context) => InputExpendProvider()),
          ChangeNotifierProvider(create: (context) => InputHartaProvider()),
          ChangeNotifierProvider(create: (context) => InputHutangProvider()),
          ChangeNotifierProvider(create: (context) => InputIdealProvider()),
          ChangeNotifierProvider(
              create: (context) => InputPendapatanProvider()),
          ChangeNotifierProvider(create: (context) => IdealBudgetProvider()),
          ChangeNotifierProvider(
              create: (context) => TotalPendapatanProvider()),
        ],
        child: MaterialApp(
          routes: {
            '/': (context) => LoginScreen(),
            // '/register': (context) => RegisterScreen(),
            // '/login': (context) => LoginScreen(),
            '/riches': (context) => RichesPage(),
            '/category': (context) => Category(),
            '/checkWallet': (context) => CheckWallet(),
            '/inputHutang': (context) => InputHutang(),
            '/inputHarta': (context) => InputHarta(),
            '/trans': (context) => RichesPage(),
            '/home': (context) => HomeTestPage(),
          },
        ));
  }
}
