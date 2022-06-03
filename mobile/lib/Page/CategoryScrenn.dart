import 'package:flutter/material.dart';
import 'package:mobile/Page/LoginScrenn.dart';

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
    // List item = [
    //   {"nama": "Harta", "icon": "assets/images/dompet.png"},
    //   {"nama": "Utang", "icon": "assets/images/export.png"},
    //   {"nama": "Pendapatan", "icon": "assets/images/settings.png"},
    // ];
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
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "How Much ?",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        hintText: 'Enter Amount', border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Name Needs",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        hintText: 'Enter Needs', border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
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
              3,
              (index) => GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 150,
                    height: 150,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            index == 0
                                ? 'assets/images/dompet.png'
                                : index == 1
                                    ? 'assets/images/export.png'
                                    : 'assets/images/settings.png',
                            // "assets/images/profile.png",
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 40,
                            ),
                            child: Text(
                              index == 0
                                  ? 'Harta'
                                  : index == 1
                                      ? 'Utang'
                                      : 'Pendapatan',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                          Text(
                            "Loren Ipsum",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 70, horizontal: 30),
            // padding:
            //     EdgeInsets.only(top: 50, left: 30, right: 30),
            child: ElevatedButton(
              onPressed: () {},
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
                primary: Color(0xff7F3DFF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minimumSize: const Size(double.infinity, 50),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
