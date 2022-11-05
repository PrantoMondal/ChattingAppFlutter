import 'package:firebase_chatting_app/db/dbhelper.dart';
import 'package:flutter/material.dart';

import '../models/msg_model.dart';

class ChatRoomProvider extends ChangeNotifier {
  List<MessageModel> msgList = [];
  Future<void> addMsg(MessageModel messageModel)=> DBHelper.addMsg(messageModel);
}