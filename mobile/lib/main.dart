import 'package:flutter/material.dart';
import 'package:mobile/Page/RichesPage.dart';
import 'package:mobile/Page/RichessPage2.dart';
import 'package:mobile/Page/pages.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:mobile/providers/delete_harta_provider.dart';
import 'package:mobile/providers/delete_hutang_provider.dart';
import 'package:mobile/providers/delete_pendapatan_provider.dart';
import 'package:mobile/providers/delete_pengeluaran_provider.dart';
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
          ChangeNotifierProvider(create: (context) => IdealBudgetProvider()),
          ChangeNotifierProvider(create: (context) => DeleteHartaProvider()),
          ChangeNotifierProvider(create: (context) => DeleteHutangProvider()),
          ChangeNotifierProvider(
              create: (context) => InputPendapatanProvider()),
          ChangeNotifierProvider(
              create: (context) => TotalPendapatanProvider()),
          ChangeNotifierProvider(
              create: (context) => DeletePendapatanProvider()),
          ChangeNotifierProvider(
              create: (context) => DeletePengeluaranProvider()),
        ],
        child: MaterialApp(
          routes: {
            '/': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/riches': (context) => RichesPage(),
            '/riches2': (context) => RichesPage2(),
            '/category': (context) => const Category(),
            '/profile': (context) => const Profile(),
            '/home': (context) => const Home(),
          },
        ));
  }
}
