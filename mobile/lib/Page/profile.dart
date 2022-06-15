import 'package:flutter/material.dart';
import 'package:mobile/Widgets/Navigator_bar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: AppBarAll(),
            bottom: 0,
          ),
          Column(
            children: [
              Row(
                children: [

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
              // Stack(
              //   children: [
              //     Positioned(
              //       child: AppBarAll(),
              //       bottom: 10,
              //     )
              //   ],
              // )
            ],
          ),
        ],
      ),
    );
  }
}

// **************************************************************************