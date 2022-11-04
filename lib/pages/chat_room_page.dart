import 'package:flutter/material.dart';

class ChatRoomPage extends StatefulWidget {
  static const String routeName = '/chatroom';

  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final msgController = TextEditingController();
  @override
  void dispose() {
    msgController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: msgController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  )),
                ),
              ),
              IconButton(
                onPressed: () {
                  msgController.clear();
                },
                icon: const Icon(Icons.send),
                color: Theme.of(context).primaryColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
