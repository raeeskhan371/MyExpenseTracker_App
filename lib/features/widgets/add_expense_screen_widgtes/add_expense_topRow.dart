import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddExpenseToprow extends StatelessWidget {
  String topTrowText;
  AddExpenseToprow({super.key, required this.topTrowText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),

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
