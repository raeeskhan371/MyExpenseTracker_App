import 'package:expense_tracker_app/features/auth/screens/profile_screen.dart';
import 'package:expense_tracker_app/features/expenses/screens/Home_Screen.dart';
import 'package:expense_tracker_app/features/expenses/screens/add_expense.dart';
import 'package:flutter/material.dart';

class BottomeNavBar extends StatefulWidget {
  const BottomeNavBar({super.key});

  @override
  State<BottomeNavBar> createState() => _BottomeNavBarState();
}

class _BottomeNavBarState extends State<BottomeNavBar> {
  int selectedIndex = 0;
  List<Widget> screens = [HomeScreen(), AddExpense(), ProfileFormScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo.shade400,
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: Colors.white,
        unselectedIconTheme: IconThemeData(color: Colors.white54),
        unselectedItemColor: Colors.white54,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
        ],
      ),
    );
  }
}
