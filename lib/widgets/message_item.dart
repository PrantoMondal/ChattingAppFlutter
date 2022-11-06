import 'package:firebase_chatting_app/models/msg_model.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  final MessageModel messageModel;

  const MessageItem({Key? key, required this.messageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: Text(messageModel.userName ?? messageModel.email),
                subtitle: Text(messageModel.timestamp.toString()),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(messageModel.msg)),
            ],
          ),
        ));
  }
}
