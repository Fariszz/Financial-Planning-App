import 'package:flutter/material.dart';
import 'package:mobile/widgets/pie_chart.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            color: Colors.amber,
            child: Text(
              'Stat',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          PieChartSample2(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Text('Harta'),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text('Utang'),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
