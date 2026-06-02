import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/features/expenses/services/firebase_services.dart';
import 'package:flutter/material.dart';

class ExpenseProvider with ChangeNotifier {
  ExpenseServices _expenseServices = ExpenseServices();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

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
}
