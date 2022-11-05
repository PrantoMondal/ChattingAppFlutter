import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chatting_app/models/msg_model.dart';
import 'package:firebase_chatting_app/models/user_model.dart';

class DBHelper {
  static const String collectionUser = 'Users';
  static const String collectionRoomMessage = 'ChatRoomMessages';

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> addUser(UserModel userModel) {
    final doc = _db.collection(collectionUser).doc(userModel.uId);
    return doc.set(userModel.toMap());
  }

  static Future<void> addMsg(MessageModel messageModel) {
    return _db
        .collection(collectionRoomMessage)
        .doc()
        .set(messageModel.toMap());
  }

  //Stream Builder
  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserById(
          String uID) =>
      _db.collection(collectionUser).doc(uID).snapshots();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllChatRoomMessages() =>
      _db.collection(collectionRoomMessage).snapshots();

  static Future<void> updateProfile(String uId, Map<String, dynamic> map) {
    return _db.collection(collectionUser).doc(uId).update(map);
  }
}
