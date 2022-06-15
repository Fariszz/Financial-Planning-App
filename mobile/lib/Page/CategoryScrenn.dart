import 'package:flutter/material.dart';
import 'package:mobile/Page/input_Harta.dart';
import 'package:mobile/Page/pages.dart';
import 'package:mobile/widgets/appbar.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: Stack(
        children: [
          Positioned(
            child: AppBarAll(),
            bottom: 0,
          ),
          Column(
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
                  padding: EdgeInsets.only(
                    top: 30,
                    left: 10,
                    right: 20,
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Categoryy',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

                  left: 20,
                  right: 20,
                  bottom: 20,
                ),

                    ),
                    CategoryIdealBudget(),
                  ],
                ),
              ),

      ),
    );
  }

  Padding CategoryBoxHarta() {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InputHarta(),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.all(10),
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: const Border.fromBorderSide(
              BorderSide(color: Color(0xff7F3DFF), width: 1),
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 219, 219, 219),
                spreadRadius: 1,
                blurRadius: 10,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 10,
                  ),
                  child: Image.asset(
                    "assets/images/harta.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 20,
                  ),
                  child: Column(
                    children: const [
                      Text(
                        "Harta",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        "Loren Ipsum aaa",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding CategoryBoxHutang() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InputHutang(),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              border: const Border.fromBorderSide(
                  BorderSide(color: Color(0xff7F3DFF), width: 1)),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 219, 219, 219),
                    spreadRadius: 1,
                    blurRadius: 10)
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Image.asset(
                    "assets/images/hutang.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Column(
                    children: const [
                      Text(
                        "Hutang",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        "Loren Ipsum aaa",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding CategoryBoxPendapatan() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InputPendapatan(),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              border: const Border.fromBorderSide(
                  BorderSide(color: Color(0xff7F3DFF), width: 1)),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 219, 219, 219),
                    spreadRadius: 1,
                    blurRadius: 10)
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Image.asset(
                    "assets/images/pendapatan.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Column(
                    children: const [
                      Text(
                        "Pendapatan",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        "Loren Ipsum aaa",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding CategoryExpenditure() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InputExpend(),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              border: const Border.fromBorderSide(
                  BorderSide(color: Color(0xff7F3DFF), width: 1)),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 219, 219, 219),
                    spreadRadius: 1,
                    blurRadius: 10)
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Image.asset(
                    "assets/images/expend.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 20,
                  ),
                  child: Column(
                    children: const [
                      Text(
                        "Expenditure",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        "Loren Ipsum aaa",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding CategoryIdealBudget() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InputIdeal(),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.all(10),
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              border: const Border.fromBorderSide(
                  BorderSide(color: Color(0xff7F3DFF), width: 1)),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 219, 219, 219),
                    spreadRadius: 1,
                    blurRadius: 10)
              ]),
          child: Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Image.asset(
                    "assets/images/ideal.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Column(
                    children: const [
                      Text(
                        "Ideal Budget",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        "Loren Ipsum aaa",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
