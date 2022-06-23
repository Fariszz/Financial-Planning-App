import 'package:flutter/material.dart';
import 'package:mobile/models/RichesModel.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:mobile/providers/ideal_budgets_provider.dart';
import 'package:mobile/providers/total_pendapatan_provider.dart';

import 'package:mobile/widgets/appbar.dart';
import 'package:mobile/widgets/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:mobile/Page/RegisterScrenn.dart';

class HomeTestPage extends StatefulWidget {
  const HomeTestPage({Key? key}) : super(key: key);

  @override
  State<HomeTestPage> createState() => _HomeTestPageState();
}

class _HomeTestPageState extends State<HomeTestPage> {
  getInit() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    await Provider.of<TotalPendapatanProvider>(context, listen: false)
        .getTotals(authProvider.user.token);

    await Provider.of<IdealBudgetProvider>(context, listen: false)
        .getIdealBudgets(authProvider.user.token);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getInit();
  }

  @override
  Widget build(BuildContext context) {
    final test = Provider.of<TotalPendapatanProvider>(context);    

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          Positioned(
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
                child: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              //appbar
              PieChartSample2(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                        Icon(
                          Icons.arrow_circle_left_outlined,
                          size: 40,
                          color: Colors.green,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Harta',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: const [
                            Icon(Icons.attach_money_outlined),
                            Text(
                              '2,545.50',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          size: 40,
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Utang',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(Icons.attach_money_outlined),
                            Text(
                              '2,545.50',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Financial',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Center(
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text('Status'),
                      Text(
                        'your financial is balance',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
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
}
