// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    HartaProvider hartaProvider = HartaProvider();

    // RichesModel total = authProvider.totalPendapatans;
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
                      HartaBox(),
                      HutangBox(),
                    ],
                  ),
                  Column(
                    children: [
                      KekayaanBersihBox(),
                      SisaPenghasilanBox(),
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
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 10),
                        child: Text('Status'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'your financial is balance',
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

  Container SisaPenghasilanBox() {
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
            Icons.account_balance_wallet_outlined,
            size: 40,
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
            children: const [
              Text(
                ' Rp 2,545.50',
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

  Container KekayaanBersihBox() {
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
            Icons.trending_up,
            size: 40,
            color: Color.fromARGB(255, 41, 114, 44),
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
            children: const [
              Text(
                ' Rp 2,545.50',
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

  Container HutangBox() {
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
            Icons.arrow_circle_down_outlined,
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
            children: const [
              Text(
                ' Rp 2,545.50',
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

  Container HartaBox() {
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
            Icons.arrow_circle_up_outlined,
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
            children: const [
              Text(
                ' Rp 2,545.50',
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
