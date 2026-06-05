import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddExpenseToprow extends StatelessWidget {
  String topTrowText;
  AddExpenseToprow({super.key, required this.topTrowText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              topTrowText,
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
