import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class InputTabungan extends StatefulWidget {
  const InputTabungan({Key? key}) : super(key: key);

  @override
  State<InputTabungan> createState() => _inputPendapatanState();
}

class _inputPendapatanState extends State<InputTabungan> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_back)),
                      const Text(
                        'Kembali',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "How Much ?",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Amount',
                            hintStyle:
                                TextStyle(fontSize: 16, color: Colors.black),
                            filled: true,
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Container(
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child: DropdownSearch(
                              onChanged: (value) => print(value),
                              showClearButton: true,
                              mode: Mode.BOTTOM_SHEET,
                              showSelectedItems: true,
                              dropdownSearchDecoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                fillColor: Colors.white,
                                hintText: 'Pilih ',
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              items: ["Harta", "Hutang", "Pendapatan"],
                            )),
                      ),
                    ),
                    InputKebutuhan(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputKebutuhan() {
    return Container(
      color: Colors.red,
      child: Container(
        padding: EdgeInsets.all(20),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Kebutuhan',
            hintStyle: const TextStyle(fontSize: 16, color: Color(0xffE0E0E0)),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
