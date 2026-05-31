import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddExpenseToprow extends StatelessWidget {
  const AddExpenseToprow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_back_ios_new, color: Colors.black),

        Expanded(
          child: Center(
            child: Text(
              "Add Expense",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
