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

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw 'Invalid email format';
      } else if (e.code == 'invalid-credential') {
        throw 'Email or password is incorrect';
      } else if (e.code == 'user-not-found') {
        throw 'No user found with this email';
      } else if (e.code == 'wrong-password') {
        throw 'Incorrect password';
      } else if (e.code == 'user-disabled') {
        throw 'This account has been disabled';
      } else if (e.code == 'too-many-requests') {
        throw 'Too many attempts. Try again later';
      } else {
        throw 'Login failed. Please try again';
      }
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      final UserCredential = _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw 'Invalid email address';
      } else if (e.code == 'missing-email') {
        throw 'Please enter your email';
      } else if (e.code == 'user-not-found') {
        throw 'No account found with this email';
      } else if (e.code == 'too-many-requests') {
        throw 'Too many attempts. Try again later';
      } else if (e.code == 'network-request-failed') {
        throw 'No internet connection';
      } else {
        throw 'Failed to send reset password email';
      }
    }
  }
}
