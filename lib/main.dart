import 'package:expense_tracker_app/features/auth/provider/auth_provider.dart';
import 'package:expense_tracker_app/features/auth/screens/forgot_screen.dart';
import 'package:expense_tracker_app/features/auth/screens/login_screen.dart';
import 'package:expense_tracker_app/features/auth/screens/signup_screen.dart';
import 'package:expense_tracker_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
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
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: ForgotScreen(),
    );
  }
}
