import 'package:flutter/material.dart';
import 'package:mobile/Page/InputTabungan.dart';
import 'package:mobile/Page/profile.dart';
import 'package:mobile/Page/trans.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({Key? key}) : super(key: key);

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    InputTabungan(),
    Transaction(),
    Profile(),
  
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        iconSize: 20,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
      ),
    );
  }
}