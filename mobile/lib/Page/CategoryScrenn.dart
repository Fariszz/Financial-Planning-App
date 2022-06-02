import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

String? nama;
String? icon;

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    List item = [
      {"nama": "Harta", "icon": "assets/images/dompet.png"},
      {"nama": "Utang", "icon": "assets/images/export.png"},
      {"nama": "Pendapatan", "icon": "assets/images/settings.png"},
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 238, 238, 238),
                    blurRadius: 10,
                    spreadRadius: 5)
              ],
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 30, left: 10, right: 20, bottom: 10),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                  const Text(
                    'Kembali',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
            child: Text(
              'Select Categori',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
              item.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 150,
                    height: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 219, 219, 219),
                              spreadRadius: 1,
                              blurRadius: 10)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            item[index]["icon"],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            item[index]["nama"],
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )),
          )
        ],
      )),
    );
  }
}
