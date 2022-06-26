// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mobile/Page/RegisterScrenn.dart';
import 'package:mobile/models/RichesModel.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:mobile/providers/harta_provider.dart';
import 'package:mobile/providers/total_pendapatan_provider.dart';
import 'package:mobile/widgets/appbar.dart';
import 'package:mobile/widgets/pie_chart.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  getInit() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    await Provider.of<TotalPendapatanProvider>(context, listen: false)
        .getTotals(authProvider.user.token);
    setState(() {
      isLoading = false;
    });
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
    // var test = totalPendapatanProvider.totalPendapatans.map((e) => e).toList();
    // RichesModel total = totalPendapatanProvider.totalPendapatans;
    // print(totalPendapatanProvider.riches.totalUtang.toString());
    var totalHarta = totalPendapatanProvider.totalPendapatans
        .map((e) => e.totalHarta).toList();
    var totalUtang = totalPendapatanProvider.totalPendapatans
        .map((e) => e.totalUtang)
        .toList();
    var totalPendapatan = totalPendapatanProvider.totalPendapatans
        .map((e) => e.totalKekayaanBersih)
        .toList();
    var sisaPenghasilan = totalPendapatanProvider.totalPendapatans
        .map((e) => e.sisaPenghasilan)
        .toList();
    var status = totalPendapatanProvider.totalPendapatans
        .map((e) => e.status)
        .toList();
    // print(total.toString());
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          const Positioned(
            child: AppBarAll(),
            bottom: 0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                color: Color(0xff7F3DFF),
                child: const Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              //appbar
              // PieChartSample2(),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: const [
                    Text(
                      'Your finalncial',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      // HartaBox("200"),
                      // HutangBox("300")
                      HartaBox(totalHarta.join("")),
                      HutangBox(totalUtang.join("")),
                    ],
                    // children:
                    // [

                    // ]
                  ),
                  Column(
                    children: [
                      // KekayaanBersihBox(test[0].totalKekayaanBersih.toString() ?? '0'),
                      // SIsaPenghasilanBox(test[0].sisaPenghasilan.toString() ?? '0'),
                      KekayaanBersihBox(totalPendapatan.join("")),
                      SIsaPenghasilanBox(sisaPenghasilan.join("")),
                    ],
                  ),
                ],
              ),

              Center(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 10),
                        child: Text('Status'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'your financial is ${status.join("")}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container SIsaPenghasilanBox(String test) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.arrow_circle_left_outlined,
            size: 40,
            color: Colors.green,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Sisa Penghasilan',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                ' Rp ' + test,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container KekayaanBersihBox(String test) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.arrow_circle_right_outlined,
            size: 40,
            color: Colors.red,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Kekayaan Bersih',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                ' Rp ' + test,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container HutangBox(String test) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.arrow_circle_right_outlined,
            size: 40,
            color: Colors.red,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Utang',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                ' Rp ' + test,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container HartaBox(String test) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.arrow_circle_left_outlined,
            size: 40,
            color: Colors.green,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Harta',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                ' Rp. ' + test,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}
