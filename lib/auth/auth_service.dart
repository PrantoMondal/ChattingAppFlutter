import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final User? user = _auth.currentUser;

  static Future<bool> login(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return credential.user != null;
  }

  static Future<bool> register(String email, String password) async {
    final credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return credential.user != null;
  }

  static Future<void> logout() => _auth.signOut();

  static bool isEmailVerified() => _auth.currentUser!.emailVerified;

  static sendVerificationMail() => _auth.currentUser!.sendEmailVerification();

  static updateDisplayName(String name) =>
      _auth.currentUser!.updateDisplayName(name);

  static updatePhoneNumber(String phone) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) {
        _auth.currentUser!.updatePhoneNumber(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
 static
  static update(String name) =>
      _auth.currentUser!.updateDisplayName(name);

  static updateDisplayName(String name) =>
      _auth.currentUser!.updateDisplayName(name);
}
