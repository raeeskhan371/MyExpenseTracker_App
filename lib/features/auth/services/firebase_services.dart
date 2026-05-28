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
    } catch (e) {}
  }
}
