import 'package:firebase_chatting_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  static const String routeName = '/userprofile';
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
    );
  }
}
