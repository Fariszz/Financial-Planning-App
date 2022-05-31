import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Image(
                  image: AssetImage('assets/images/profile.png'),
                ),
              ),
              // SizedBox(
              //   width: 20,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Iriana Saliha',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {},
                child: Image(
                  image: AssetImage('assets/images/edit.png'),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/images/dompet.png'),
                ),
                SizedBox(
                  width: 20,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'My Wallet',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/images/settings.png'),
                ),
                SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/images/export.png'),
                ),
                SizedBox(
                  width: 20,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Export Data',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/images/logout.png'),
                ),
                SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// **************************************************************************