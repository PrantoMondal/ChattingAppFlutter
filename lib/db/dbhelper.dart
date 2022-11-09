import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chatting_app/models/msg_model.dart';
import 'package:firebase_chatting_app/models/user_model.dart';

class DBHelper {
  static const String collectionUser = 'Users';
  static const String collectionRoomMessage = 'ChatRoomMessages';

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> addUser(UserModel userModel) {
    final doc = _db.collection(collectionUser).doc(userModel.uid);
    return doc.set(userModel.toMap());
  }

  static Future<void> addMsg(MessageModel messageModel) {
    return _db.collection(collectionRoomMessage)
        .doc()
        .set(messageModel.toMap());
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserByUid(String uid) =>
      _db.collection(collectionUser)
          .doc(uid).snapshots();

  static Future<DocumentSnapshot<Map<String, dynamic>>> getUserByUidFuture(String uid) =>
      _db.collection(collectionUser)
          .doc(uid).get();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllChatRoomMessages() =>
      _db.collection(collectionRoomMessage)
          .orderBy('msgId', descending: true)
          .snapshots();

  static Future<void> updateProfile(String uid, Map<String, dynamic> map) {
    return _db.collection(collectionUser).doc(uid).update(map);
  }
}
