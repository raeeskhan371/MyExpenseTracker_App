import 'package:expense_tracker_app/features/expenses/services/firebase_services.dart';
import 'package:flutter/material.dart';

class ExpenseProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final ExpenseServices _expenseServices = ExpenseServices();
  Future<void> setBalance({required double balance}) async {
    _isLoading = true;
    notifyListeners();
    await _expenseServices.setInitialBalance(balance: balance);
    _isLoading = false;
  }
}
