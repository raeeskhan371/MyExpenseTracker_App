import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/features/expenses/model/expense_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExpenseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Set InitialBalace Function
  Future<void> setInitialBalance({required double balance}) async {
    var uid = _auth.currentUser!.uid;

    await _firestore.collection("Users").doc(uid).set({
      "initialBalance": balance,
    }, SetOptions(merge: true));
  }

  // getStream DataS

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserData() {
    final uid = _auth.currentUser!.uid;

    return _firestore.collection("Users").doc(uid).snapshots();
  }

  // add expense

  Future<void> addExpense({
    required String title,
    required double amount,
    required String note,
  }) async {
    final expenseModel = ExpenseModel(title: title, amount: amount, note: note);
    final uid = _auth.currentUser!.uid;

    final userRef = _firestore.collection("Users").doc(uid);
    await userRef.collection("Expenses").add(expenseModel.toMap());
    final snapshot = await userRef.get();
    final data = snapshot.data() as Map<String, dynamic>;
    final currentBalance =
        double.tryParse(data["initialBalance"].toString()) ?? 0.0;
  }

  // getExpense Tile;
  Stream<QuerySnapshot> getExpneseTile() {
    final uid = _auth.currentUser!.uid;

    return _firestore
        .collection("Users")
        .doc(uid)
        .collection("Expenses")
        .snapshots();
  }

  // Update Expense

  Future<void> updateExpenseButton({
    required String id,
    required String title,
    required double amount,
  }) async {
    final uid = _auth.currentUser!.uid;
    final userRefr = _firestore.collection("Users").doc(uid);

    await userRefr.collection("Expenses").doc(id).update({
      "title": title,
      "amount": amount,
    });
  }
  // Delete Expenese

  Future<void> deleteExpensebutton({required String id}) async {
    final uid = _auth.currentUser!.uid;
    final userRefr = _firestore.collection("Users").doc(uid);

    await userRefr.collection("Expenses").doc(id).delete();
  }

  /// Fetch Reaming Balance

  Future<double> fetchRemainingBalance() async {
    final uid = _auth.currentUser!.uid;
    final userRef = _firestore.collection("Users").doc(uid);
    final userDoc = await _firestore.collection("Users").doc(uid).get();
    final expenseSnapShot = await userRef.collection("Expenses").get();

    final initalBalance = (userDoc["initialBalance"] as num).toDouble();
    double totalExpense = 0;

    for (var e in expenseSnapShot.docs) {
      totalExpense += (e["amount"] as num).toDouble();
    }
    final double remaining = initalBalance - totalExpense;
    return remaining < 0 ? 0.00 : remaining;
  }

  //UserName Fetching

  Future<String> getUserName() async {
    final uid = _auth.currentUser!.uid;
    var docs = await _firestore.collection("Users").doc(uid).get();

    final userName = (docs["name"]).toString();
    return userName;
  }
}
