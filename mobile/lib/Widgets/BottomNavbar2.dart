import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Page/pages.dart';

class BottomNavbar2 extends StatefulWidget {
  const BottomNavbar2({Key? key}) : super(key: key);

  @override
  State<BottomNavbar2> createState() => _BottomNavbar2State();
}

class _BottomNavbar2State extends State<BottomNavbar2> {
  int _selectedIndex = 0;

  List page = [
    InputHutang(),
    Profile(),
    Transaction(),
  ];

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Color(0xff7F3DFF),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: GNav(
            backgroundColor: Color(0xff7F3DFF),
            color: Colors.black,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.white,
            padding: EdgeInsets.all(15),
            gap: 5,
            duration: Duration(milliseconds: 600),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.favorite,
                text: "Favorite",
              ),
              GButton(
                icon: Icons.search,
                text: "Search",
              ),
              GButton(
                icon: Icons.money,
                text: "Money",
              ),
            ],
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
              _controller.jumpToPage(index);
            },
            selectedIndex: _selectedIndex,
          ),
        ),
      ),
    );
  }
}
