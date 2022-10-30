import 'package:flutter/material.dart';
import 'package:firebase_chatting_app/db/dbhelper.dart';
import 'package:firebase_chatting_app/models/user_model.dart';


class UserProvider extends ChangeNotifier{
  List <UserModel>userList = [];
  Future<void> addUser(UserModel userModel) => DBHelper.addUser(userModel);


}