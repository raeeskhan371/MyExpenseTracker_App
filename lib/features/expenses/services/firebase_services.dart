import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/features/auth/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ExpenseServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> setInitialBalance({required double balance}) async {
    var uid = FirebaseAuth.instance.currentUser?.uid;

    _firebaseFirestore.collection("user").doc(uid).set({
      "initialBalance": balance,
    }, SetOptions(merge: true));
  }
}
