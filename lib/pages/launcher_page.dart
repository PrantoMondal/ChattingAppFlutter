import 'package:firebase_chatting_app/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName = '/launcher';
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero,(){
       if(AuthService.user == null){
         Navigator.pushReplacementNamed(context, LoginPage.routeName);
       }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
