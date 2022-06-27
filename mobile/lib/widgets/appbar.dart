import 'package:flutter/material.dart';
import 'package:mobile/Page/RichesPage.dart';
import 'package:mobile/Page/RichessPage2.dart';
import 'package:mobile/Page/pages.dart';

class AppBarAll extends StatelessWidget {
  const AppBarAll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: InkWell(
            onTap: () {
              Navigator.popAndPushNamed(context, '/home');
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 5,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  Text(
                    "home",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.indigo,
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/riches');
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 5,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.monetization_on,
                    color: Colors.grey,
                  ),
                  Text(
                    "Trasaction",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.indigo,
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/riches2');
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 5,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.monetization_on,
                    color: Colors.grey,
                  ),
                  Text(
                    "Trasaction",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.indigo,
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: InkWell(
            onTap: () {
               Navigator.pushNamed(context, '/category');
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 5,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.category,
                    color: Colors.grey,
                  ),
                  Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.indigo,
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: InkWell(
            onTap: () {
         Navigator.pushNamed(context, '/profile');
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 5,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.supervised_user_circle_sharp,
                    color: Colors.grey,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.indigo,
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
