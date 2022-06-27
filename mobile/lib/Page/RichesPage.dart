import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/Page/RegisterScrenn.dart';
import 'package:mobile/Page/pages.dart';
import 'package:mobile/Service/delete_harta_service.dart';
import 'package:mobile/models/RichesHarta_model.dart';
import 'package:mobile/models/RichesUtang_model.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:mobile/providers/delete_harta_provider.dart';
import 'package:mobile/providers/delete_hutang_provider.dart';
import 'package:mobile/providers/harta_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../providers/hutang_provider.dart';

class RichesPage extends StatefulWidget {
  RichesPage({Key? key}) : super(key: key);

  @override
  State<RichesPage> createState() => _RichesPageState();
}

class _RichesPageState extends State<RichesPage> {

  // final RichesUtangModel hutangRemove =
  //     RichesUtangModel(utang: '', id: 0, rupiah: 0);

  getInit() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    DeleteHartaService deleteHutangService = DeleteHartaService();

    DeleteHartaService deleteService = DeleteHartaService();

    await Provider.of<HartaProvider>(context, listen: false)
        .getHartas(authProvider.user.token);

    await Provider.of<HutangProvider>(context, listen: false)
        .getHutangs(authProvider.user.token);
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    getInit();
  }

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    final bodyHeight = sizeHeight - MediaQuery.of(context).padding.top;

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    HartaProvider hartaProvider = Provider.of<HartaProvider>(context);
    HutangProvider hutangProvider = Provider.of<HutangProvider>(context);

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xff7F3DFF),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 238, 238, 238),
                        blurRadius: 10,
                        spreadRadius: 5)
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 30, right: 20, bottom: 10),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Transaction',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
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
                children: hartaProvider.hartas
                    .map<Widget>((harta) =>
                        HartaBox(harta, authProvider.user.token, harta.id!))
                    .toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Utang',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Column(
                children: hutangProvider.hutangs
                    .map<Widget>((hutang) =>
                        BoxHutang(hutang, authProvider.user.token, hutang.id!))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxHutang(RichesUtangModel hutang, String token, int id) {
    HutangProvider hutangProvider = Provider.of<HutangProvider>(context);
    DeleteHutangProvider deleteHutangProvider =
        Provider.of<DeleteHutangProvider>(context);

    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    final bodyHeight = sizeHeight - MediaQuery.of(context).padding.top;

    return SizedBox(
      height: bodyHeight * 0.1,
      child: ListView.builder(
        itemCount: 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Row(
          children: [
            Container(
              width: 250,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
              // width: sizeWidth * 0.4,
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hutang.utang!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 150,
              child: Row(
                children: [
                  Container(
                    // color: Colors.red,
                    // width: sizeWidth * 0.4,
                    child: Text(
                      'Rp. ' + hutang.rupiah.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 218, 3, 3),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.expand_more_outlined,
                    color: Color.fromARGB(255, 160, 11, 0),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    deleteHutangProvider.deleteHutang(id, token);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text(
                        'Data berhasil dihapus',
                      ),
                      backgroundColor: const Color.fromARGB(255, 94, 202, 98),
                      action: SnackBarAction(
                          label: 'Dismis',
                          textColor: Colors.black,
                          onPressed: () {}),
                      duration: Duration(seconds: 4),
                    ));

                    hutangProvider.removeHutang(id);
                  },
                  child: const Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  HartaBox(RichesHartaModel harta, String token, int id) {
    HartaProvider hartaProvider = Provider.of<HartaProvider>(context);
    DeleteHartaProvider deleteHartaProvider =
        Provider.of<DeleteHartaProvider>(context);

    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    final bodyHeight = sizeHeight - MediaQuery.of(context).padding.top;

    return SizedBox(
      height: bodyHeight * 0.1,
      child: ListView.builder(
        itemCount: 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Row(
          children: [
            Container(
              width: 250,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
              // width: sizeWidth * 0.4,
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    harta.harta!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 150,
              child: Row(
                children: [
                  Container(
                    // color: Colors.red,
                    // width: sizeWidth * 0.4,
                    child: Text(
                      'Rp. ' + harta.rupiah.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 81, 199, 85),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Icon(
                      Icons.expand_less_rounded,
                      color: Color.fromARGB(255, 3, 158, 8),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    deleteHartaProvider.deleteHarta(id, token);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text(
                        'Data berhasil dihapus',
                      ),
                      backgroundColor: const Color.fromARGB(255, 94, 202, 98),
                      action: SnackBarAction(
                          label: 'Dismis',
                          textColor: Colors.black,
                          onPressed: () {}),
                      duration: Duration(seconds: 4),
                    ));
                    hartaProvider.removeHarta(id);
                  },
                  child: const Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
