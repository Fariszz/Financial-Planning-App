import 'package:flutter/material.dart';
import 'package:mobile/models/RichesExpend_model.dart';
import 'package:mobile/models/RichesPendapatan_mode.dart';
import 'package:mobile/providers/pendapatan_provider.dart';
import 'package:mobile/providers/pengeluaran_provider.dart';
import 'package:provider/provider.dart';
import 'package:mobile/Page/RegisterScrenn.dart';

import '../providers/auth_provider.dart';

class CheckWallet extends StatefulWidget {
  CheckWallet({Key? key}) : super(key: key);

  @override
  State<CheckWallet> createState() => _CheckWalletState();
}

class _CheckWalletState extends State<CheckWallet> {
  getInit() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    await Provider.of<PengeluaranProvider>(context, listen: false)
        .getPengeluarans(authProvider.user.token);

    await Provider.of<PendapatanProvider>(context, listen: false)
        .getPendapatans(authProvider.user.token);

    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    getInit();
  }

  @override
  Widget build(BuildContext context) {
    PendapatanProvider pendapatanProvider =
        Provider.of<PendapatanProvider>(context);
    PengeluaranProvider pengeluaranProvider =
        Provider.of<PengeluaranProvider>(context, listen: false);
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
            children: pendapatanProvider.pendapatans
                .map<Widget>((pendapatan) => HartaBox(pendapatan))
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
            children: pengeluaranProvider.pengeluarans
                .map<Widget>((pengeluaran) => BoxHutang(pengeluaran))
                .toList(),
          ),
        ],
      ),
    );
  }

  BoxHutang(RichesExpendModel pengeluaran) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          pengeluaran.pengeluaran,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Rp.' + pengeluaran.rupiah.toString(),
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

  HartaBox(RichesPendapatanModel pendapatan) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          pendapatan.penghasilan,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Rp. ' + pendapatan.rupiah.toString(),
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
