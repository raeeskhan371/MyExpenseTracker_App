import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/features/expenses/model/expense_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  // add expense

  Future<void> addExpense({
    required String title,
    required double amount,
    required String category,
  }) async {
    final expense = ExpenseModel(
      title: title,
      amount: amount,
      category: category,
      createdAt: DateTime.now(),
    );

    final uid = _auth.currentUser!.uid;

    final userRef = _firestore.collection("user").doc(uid);
    await userRef.collection("expense").add(expense.toMap());
    final snapshot = await userRef.get();
    final data = snapshot.data() as Map<String, dynamic>;

    final currentBalance =
        double.tryParse(data["initialBalance"].toString()) ?? 0.0;
    final newBalance = currentBalance - amount;
    await userRef.update({"initialBalance": newBalance});
  }

  // getExpense Tile;
  Stream<QuerySnapshot> getExpneseTile() {
    final uid = _auth.currentUser!.uid;

    return _firestore
        .collection("user")
        .doc(uid)
        .collection("expense")
        .snapshots();
  }
}
