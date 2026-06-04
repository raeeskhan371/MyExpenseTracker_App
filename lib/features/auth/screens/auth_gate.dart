import 'package:expense_tracker_app/features/auth/screens/login_screen.dart';
import 'package:expense_tracker_app/features/expenses/screens/bottom_navigation.dart';
import 'package:expense_tracker_app/features/expenses/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: CircularProgressIndicator(color: Colors.blue));
        }
        if (snapshot.hasData) {
          return BottomeNavBar();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
