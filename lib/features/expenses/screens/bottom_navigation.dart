import 'package:expense_tracker_app/features/auth/screens/profile_screen.dart';
import 'package:expense_tracker_app/features/expenses/screens/Home_Screen.dart';
import 'package:expense_tracker_app/features/expenses/screens/add_expense.dart';
import 'package:expense_tracker_app/features/expenses/screens/set_initial_balance.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomeNavBar extends StatefulWidget {
  const BottomeNavBar({super.key});

  @override
  State<BottomeNavBar> createState() => _BottomeNavBarState();
}

class _BottomeNavBarState extends State<BottomeNavBar> {
  void changeTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  int selectedIndex = 0;
  late List<Widget> screens = [
    HomeScreen(),
    AddExpense(
      onExpenseAdd: () {
        changeTap(0);
      },
    ),
    ProfileFormScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo.shade400,
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: Colors.white,
        unselectedIconTheme: IconThemeData(color: Colors.white54),
        unselectedItemColor: Colors.white54,
        selectedFontSize: 16,
        selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        unselectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        currentIndex: selectedIndex,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
