import 'package:expense_tracker_app/features/auth/provider/auth_user_provider.dart';
import 'package:expense_tracker_app/features/auth/screens/auth_gate.dart';
import 'package:expense_tracker_app/features/expenses/provider/expense_provider.dart';
import 'package:expense_tracker_app/features/expenses/screens/Notification_ScreenTesting.dart';
import 'package:expense_tracker_app/features/expenses/screens/bottom_navigation.dart';
import 'package:expense_tracker_app/features/expenses/screens/home_screen.dart';
import 'package:expense_tracker_app/features/expenses/services/notification_services.dart';
import 'package:expense_tracker_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  NotificationServices().initNotification();
  await NotificationServices.intilazationNotifiction();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ExpenseProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyExpense Tracker',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
