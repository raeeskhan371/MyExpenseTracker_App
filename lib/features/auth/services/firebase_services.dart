import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/features/auth/model/authModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class authServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> singupUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final String uid = UserCredential.user!.uid;

      final userModel = AuthModel(
        name: name,
        email: email,
        uid: uid,
        createdAt: DateTime.now(),
      );

      await _firestore.collection("user").doc(uid).set(userModel.toMap());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw "This email is already registered.";
      } else if (e.code == 'invalid-email') {
        throw "Please enter a valid email address.";
      } else if (e.code == 'weak-password') {
        throw "Password is too weak. Use at least 6 characters.";
      } else if (e.code == 'network-request-failed') {
        throw "No internet connection. Please check your network.";
      } else if (e.code == 'user-disabled') {
        throw "This account has been disabled.";
      } else {
        throw "Something went wrong. Please try again.";
      }
    }
  }
}
