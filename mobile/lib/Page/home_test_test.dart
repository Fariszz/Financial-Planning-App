import 'package:flutter/material.dart';
import 'package:mobile/Page/RegisterScrenn.dart';
import 'package:mobile/models/RichesModel.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/ideal_budgets_provider.dart';
import '../providers/total_pendapatan_provider.dart';

class HomeTestTest extends StatefulWidget {
  const HomeTestTest({Key? key}) : super(key: key);

  @override
  State<HomeTestTest> createState() => _HomeTestTestState();
}

class _HomeTestTestState extends State<HomeTestTest> {
  getInit() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    // await Provider.of<TotalPendapatanProvider>(context, listen: false)
    //     .getTotals(authProvider.user.token);
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    getInit();
  }

  @override
  Widget build(BuildContext context) {
    TotalPendapatanProvider totalPendapatanProvider =
        Provider.of<TotalPendapatanProvider>(context);
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30, left: 20, bottom: 20),
                width: double.infinity,
                color: Color(0xff7F3DFF),
                child: const Text(
                  'Transaction',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                child: const Text(
                  'Harta',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Column(
                // children: totalPendapatanProvider.totalPendapatans
                //     .map((totalPendapatan) => Text(totalPendapatan.totalHarta.toString()))
                //     .toList(),
                // children:  totalPendapatans
                // children: hartaProvider.hartas
                //     .map<Widget>((harta) => BoxHutang())
                //     .toList(),
                // get data from provider total harta
              ),
            ],
          ),
        ),
      ),
    );
  }
}
