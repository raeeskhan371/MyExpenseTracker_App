import 'package:expense_tracker_app/features/auth/screens/auth_gate.dart';
import 'package:expense_tracker_app/features/auth/screens/forgot_screen.dart';
import 'package:expense_tracker_app/features/auth/screens/login_screen.dart';
import 'package:expense_tracker_app/features/auth/screens/profile_screen.dart';
import 'package:expense_tracker_app/features/auth/screens/signup_screen.dart';
import 'package:expense_tracker_app/features/expenses/screens/Home_Screen.dart';
import 'package:expense_tracker_app/features/expenses/screens/bottom_navigation.dart';
import 'package:flutter/material.dart';

class RoutesHelper {
  static final String intialRoute = "/";
  static const String SingUp = "/SignupScreen";
  static const String Login = "/LoginScreen";
  static const String ForgotPassword = "/ForgotScreen";
  static const String Home = "/HomeScreen";
  static const String AddExpensee = "/AddExpense";
  static const String UpdateExpense = "/UpdateExpense";
  static const String BottomNavigationBar = "/BottomeNavBar";
  static const String InitialBalance = "/WalletScreen";
  static const String Profile = "/ProfileFormScreen";

  static myRoutes() {
    return {intialRoute: (context) => AuthGate()};
  }

  static generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case SingUp:
        return {MaterialPageRoute(builder: (_) => SignupScreen())};
      case Login:
        return {MaterialPageRoute(builder: (_) => LoginScreen())};
      case ForgotPassword:
        return {MaterialPageRoute(builder: (_) => ForgotScreen())};
      case Home:
        return {MaterialPageRoute(builder: (_) => HomeScreen())};

      case BottomNavigationBar:
        return {MaterialPageRoute(builder: (_) => BottomeNavBar())};
      case Profile:
        return {MaterialPageRoute(builder: (_) => ProfileFormScreen())};
    }
  }
}
