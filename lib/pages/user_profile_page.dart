import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chatting_app/auth/auth_service.dart';
import 'package:firebase_chatting_app/providers/user_provider.dart';
import 'package:firebase_chatting_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';

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
      body: Center(
        child: Consumer<UserProvider>(
          builder: (context, provider, _) => StreamBuilder <DocumentSnapshot<Map<String, dynamic>>>(
            stream: provider.getUserById(AuthService.user!.uid),
            builder: (context, snapshot){
              if(snapshot.hasData){
                final userModel = UserModel.fromMap(snapshot.data!.data()!);
                return ListView(
                  children: const [
                    Center(
                      child: userModel.image == null? Image.asset('assets/images/image.jpg',width: 100,height: 100,fit:BoxFit.cover):
                  ,
                    )

                  ],
                );
              }
              if(snapshot.hasError){
                return const Text('Failed to fetch data');
              }
              else{
                return const CircularProgressIndicator();
              }
            },
            
          ),
        ),
      ),
    );
  }
}
