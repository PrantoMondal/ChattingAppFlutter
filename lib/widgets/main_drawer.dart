import 'package:firebase_chatting_app/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../pages/login_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 200,
            color: Colors.blue,
          ),
          ListTile(
            onTap: () async{
              await AuthService.logout();
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
            leading: Icon(Icons.logout),
            title: const Text('Log Out'),
          )
        ],
      ),
    );
  }
}
