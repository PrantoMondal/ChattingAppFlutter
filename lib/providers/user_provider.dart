import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_chatting_app/db/dbhelper.dart';
import 'package:firebase_chatting_app/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> userList = [];

  Future<void> addUser(UserModel userModel) => DBHelper.addUser(userModel);

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserById(String uID) =>
      DBHelper.getUserById(uID);


  // Photo download url method
  Future <String> updateImage(XFile xFile) async {
    final imageName = DateTime.now().millisecondsSinceEpoch.toString();
    final photoRef = FirebaseStorage.instance.ref().child('pictures/$imageName');
    photoRef.putFile(File(xFile.path));
    final uploadTask = photoRef.putFile(File(xFile.path));
    final snapshot = await uploadTask.whenComplete(() => null);
    return snapshot.ref.getDownloadURL();

  }
}
