import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/features/expenses/model/expense_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExpenseFirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //  setInitialBalance Function
  Future<void> setBalance({required double balance}) async {
    var uid = _auth.currentUser!.uid;

    await _firestore.collection("user").doc(uid).set({
      "balance": balance,
    }, SetOptions(merge: true));
  }

  // watchUserData function

  Stream<DocumentSnapshot<Map<String, dynamic>>> watchUserData() {
    final uid = _auth.currentUser!.uid;
    return _firestore.collection("user").doc(uid).snapshots();
  }

  // add expense function

  Future<void> addExpense({
    required String title,
    required double amount,
    required String note,
  }) async {
    final expense = ExpenseModel(
      title: title,
      amount: amount,
      note: note,
      createdAt: DateTime.now(),
    );
    final uid = _auth.currentUser!.uid;
    final userRef = _firestore.collection("user").doc(uid);
    await userRef.collection("expense").add(expense.toMap());
  }

  // watchExpenses function
  Stream<QuerySnapshot> watchExpenses() {
    final uid = _auth.currentUser!.uid;

    return _firestore
        .collection("user")
        .doc(uid)
        .collection("expense")
        .snapshots();
  }

  // updateExpense function

  Future<void> updateExpense({
    required String id,
    required String title,
    required double amount,
  }) async {
    final uid = _auth.currentUser!.uid;
    final userRefr = _firestore.collection("user").doc(uid);

    await userRefr.collection("expense").doc(id).update({
      "title": title,
      "amount": amount,
    });
  }
  // deleteExpense function

  Future<void> deleteExpense({required String id}) async {
    final uid = _auth.currentUser!.uid;
    final userRefr = _firestore.collection("Users").doc(uid);

    await userRefr.collection("expense").doc(id).delete();
  }

  /// Fetch Reaming Balance

  //fetchUserName

  Future<String> fetchUserName() async {
    final uid = _auth.currentUser!.uid;
    var docs = await _firestore.collection("user").doc(uid).get();

    final userName = (docs["name"]).toString();
    return userName;
  }
}
