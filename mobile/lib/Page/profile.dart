import 'package:flutter/material.dart';
import 'package:mobile/Page/LoginScrenn.dart';
import 'package:mobile/Widgets/Navigator_bar.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:mobile/providers/input_provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: const Image(
                  image: AssetImage('assets/images/profileIcons.png'),
                ),
              ),
              // SizedBox(
              //   width: 20,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.name}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '${user.email}',  
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 40),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.white,
              //   ),
              //   onPressed: () {},
              //   child: const Image(
              //     image: AssetImage('assets/images/edit.png'),
              //   ),
              // )
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                const Image(
                  image: AssetImage('assets/images/dompet.png'),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
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
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Image(
                  image: AssetImage('assets/images/settings.png'),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
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
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Image(
                  image: AssetImage('assets/images/export.png'),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Export Data',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              authProvider.logout(authProvider.user.token);
              Navigator.popAndPushNamed(context, '/');
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Row(
                children: const [
                  Image(
                    image: AssetImage('assets/images/logout.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// **************************************************************************