// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mobile/models/RichesHarta_model.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:mobile/providers/get_provider.dart';
import 'package:provider/provider.dart';

class Transaction extends StatelessWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    GetProvider getProvider = Provider.of<GetProvider>(context);

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
            children: getProvider.getHarta
                .map(
                  (getHarta) => TransactionCardHarta(getHarta),
                )
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
            children: [BoxHutang()],
          ),
        ],
      ),
    );
  }

  BoxHutang() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Mobil',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Text(
          'Rp 1.000.000',
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

  HartaBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Mobil',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Text(
          'Rp 1.000.000',
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

class TransactionCardHarta extends StatelessWidget {
  final RichesHartaModel harta;
  TransactionCardHarta(this.harta);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          // harta.harta,
          '${harta.harta}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '${harta.rupiah.toString()}',
          // harta.rupiah.toString(),
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
}
