import 'package:flutter/material.dart';
import 'package:mobile/Page/pages.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:mobile/providers/input_expend_provider.dart';

import 'package:provider/provider.dart';

class InputExpend extends StatelessWidget {
  InputExpend({Key? key}) : super(key: key);

  TextEditingController rupiahController = TextEditingController();
  TextEditingController pengeluaranController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    InputExpendProvider inputProvider =
        Provider.of<InputExpendProvider>(context);

    handleContinue() async {
      if (await inputProvider.InputExpend(
        token: user.token,
        pengeluaran: pengeluaranController.text,
        rupiah: int.parse(rupiahController.text),
      )) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text(
            'Data Berhasil Ditambahkan',
            textAlign: TextAlign.center,
          ),
          backgroundColor: const Color.fromARGB(255, 94, 202, 98),
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
              label: 'Dismis', textColor: Colors.black, onPressed: () {}),
          duration: Duration(seconds: 4),
        ));
        Navigator.pushNamed(context, '/category');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text(
            'Data Gagal Ditambahkan',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Color.fromARGB(255, 241, 76, 64),
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
              label: 'Dismis', textColor: Colors.black, onPressed: () {}),
          duration: Duration(seconds: 4),
        ));
      }
      ;
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 223, 223),
      body: SingleChildScrollView(
        child: Column(
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Category()));
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 80),
                      child: Text(
                        'Input Expend',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "How Much ?",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: rupiahController,
                        cursorColor: Colors.black,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                            hintText: 'Enter Amount', border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              elevation: 5,
            ),
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Name expense",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: pengeluaranController,
                        cursorColor: Colors.black,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                            hintText: 'Enter name expense',
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              elevation: 5,
            ),
            Card(
              child: Container(
                height: size.height * 0.4,
              ),
              elevation: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: TextButton(
                onPressed: handleContinue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Continue",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 93, 37, 204),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minimumSize: const Size(double.infinity, 50),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
