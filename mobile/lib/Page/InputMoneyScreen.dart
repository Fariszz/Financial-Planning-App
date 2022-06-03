import 'package:flutter/material.dart';

class inputMoney extends StatefulWidget {
  const inputMoney({Key? key}) : super(key: key);

  @override
  State<inputMoney> createState() => _inputMoneyState();
}

class _inputMoneyState extends State<inputMoney> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(color: Colors.red),
            child: SafeArea(
                child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_back)),
                      const Text(
                        'Kembali',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "How Much",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Amount",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height - (size.height / 4),
              width: size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
