import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  int? msgId;
  String? userUid;
  String? userName;
  String? userImage;
  String msg;
  Timestamp timestamp;
  String? image;

  MessageModel(
      {this.msgId,
      this.userUid,
      this.userName,
      this.userImage,
      required this.msg,
      required this.timestamp,
      this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'msgId': msgId,
      'userUid': userUid,
      'userName': userName,
      'userImage': userImage,
      'msg': msg,
      'timestamp': timestamp,
      'image': image
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) => MessageModel(
      msgId: map['msgId'],
      userUid: map['userUid'],
      userName: map['userName'],
      userImage: map['userImage'],
      msg: map['msg'],
      timestamp: map['timestamp'],
      image: map['image']);
}
