import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chatting_app/auth/auth_service.dart';
import 'package:firebase_chatting_app/db/dbhelper.dart';
import 'package:flutter/material.dart';

import '../models/msg_model.dart';

class ChatRoomProvider extends ChangeNotifier {
  List<MessageModel> msgList = [];

  Future<void> addMsg(String msg) {
    final messageModel = MessageModel(
        msgId: DateTime.now().millisecondsSinceEpoch,
        userUid: AuthService.user!.uid,
        msg: msg,
        timestamp: Timestamp.fromDate(DateTime.now()),
    );
    return DBHelper.addMsg(messageModel);
  }

  getAllChatRoomMessages() {
    DBHelper.getAllChatRoomMessages().listen((snapshot) {
      msgList = List.generate(snapshot.docs.length,
          (index) => MessageModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }
}
