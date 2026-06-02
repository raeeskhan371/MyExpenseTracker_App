import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ExpenseServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Set InitialBalace Function
  Future<void> setInitialBalance({required double balance}) async {
    var uid = _auth.currentUser!.uid;

    await _firestore.collection("user").doc(uid).set({
      "initialBalance": balance,
    }, SetOptions(merge: true));
  }

  // getStream DataS

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserData() {
    final uid = _auth.currentUser!.uid;

    return _firestore.collection("user").doc(uid).snapshots();
  }
}
