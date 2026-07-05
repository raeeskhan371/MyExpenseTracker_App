import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/features/expenses/services/firebase_services.dart';
import 'package:flutter/material.dart';

class ExpenseProvider with ChangeNotifier {
  final ExpenseServices _expenseServices = ExpenseServices();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void loading(bool value) {
    _isLoading = value;
  }

  Future<void> setBalance({required double balance}) async {
    _isLoading = true;
    notifyListeners();

    await _expenseServices.setInitialBalance(balance: balance);

    _isLoading = false;
    notifyListeners();
  }

  // Get Balance

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUser() {
    return _expenseServices.getUserData();
  }

  //Add Expense
  Future<void> addExpenses({
    required String title,
    required double amount,
    required String note,
  }) async {
    loading(true);
    notifyListeners();

    await _expenseServices.addExpense(title: title, amount: amount, note: note);

    loading(false);
    notifyListeners();
  }
  // get expenseTIle

  Stream<QuerySnapshot> getExpneseTileData() {
    return _expenseServices.getExpneseTile();
  }
  // Update Expense

  Future<void> updateExpense({
    required String id,
    required String title,
    required double amount,
  }) async {
    loading(true);
    notifyListeners();
    await _expenseServices.updateExpenseButton(
      id: id,
      title: title,
      amount: amount,
    );
    loading(false);
    notifyListeners();
  }

  // deleteExpense

  Future<void> deleteExpense({required String id}) async {
    return await _expenseServices.deleteExpensebutton(id: id);
  }

  // User Reamining Balance

  Stream<double> userReamingBalance() {
    return _expenseServices.fetchRemainingBalance();
  }

  Future<String> fetchingUserName() async {
    var userName = await _expenseServices.getUserName();
    return userName;
  }
}
