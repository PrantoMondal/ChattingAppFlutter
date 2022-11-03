import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chatting_app/models/user_model.dart';

class DBHelper {
  static const String collectionUser = 'users';

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> addUser(UserModel userModel) {
    final doc = _db.collection(collectionUser).doc(userModel.uId);
    return doc.set(userModel.toMap());
  }

  //Stream Builder
  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserById(
          String uID) =>
      _db.collection(collectionUser).doc(uID).snapshots();

  static Future<void> updateProfile(String uId, Map<String, dynamic>map){
    return _db.collection(collectionUser).doc(uId).update(map);
  }

}
