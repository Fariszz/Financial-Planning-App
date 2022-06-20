import 'package:flutter/material.dart';
import 'package:mobile/Page/RegisterScrenn.dart';
import 'package:mobile/models/RichesHarta_model.dart';
import 'package:mobile/models/RichesUtang_model.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:mobile/providers/harta_provider.dart';
import 'package:provider/provider.dart';

import '../providers/hutang_provider.dart';

class RichesPage extends StatefulWidget {
  RichesPage({Key? key}) : super(key: key);

  @override
  State<RichesPage> createState() => _RichesPageState();
}

class _RichesPageState extends State<RichesPage> {
  getInit() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
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
    HartaProvider hartaProvider = Provider.of<HartaProvider>(context);
    HutangProvider hutangProvider = Provider.of<HutangProvider>(context);

    return Scaffold(
      body: Column(
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
            // children: hartaProvider.hartas
            //     .map<Widget>((harta) => BoxHutang())
            //     .toList(),
            children: hartaProvider.hartas
                .map<Widget>((harta) => HartaBox(harta))
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
                .map<Widget>((hutang) => BoxHutang(hutang))
                .toList(),
          ),
        ],
      ),
    );
  }

  BoxHutang(RichesUtangModel hutang) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          hutang.utang,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Rp.' + hutang.rupiah.toString(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.red,
          ),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.edit),
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.delete),
            ),
          ],
        ),
      ],
    );
  }

  HartaBox(RichesHartaModel harta) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          harta.harta,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Rp. ' + harta.rupiah.toString(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.green,
          ),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.edit),
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.delete),
            ),
          ],
        ),
      ],
    );
  }
}
