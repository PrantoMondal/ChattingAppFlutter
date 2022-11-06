import 'package:firebase_chatting_app/auth/auth_service.dart';
import 'package:firebase_chatting_app/models/msg_model.dart';
import 'package:firebase_chatting_app/utils/helper_functions.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  final MessageModel messageModel;

  const MessageItem({Key? key, required this.messageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: messageModel.userUid == AuthService.user!.uid
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(messageModel.userName ?? messageModel.email),
          Text(getFormattedDate(messageModel.timestamp.toDate())),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                messageModel.msg,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              )),
        ],
      ),
    ));
  }
}
