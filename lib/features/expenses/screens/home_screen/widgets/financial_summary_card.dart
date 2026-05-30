import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinancialSummaryCard extends StatelessWidget {
  IconData transactionIcon;
  Color smallContainer;
  Color MonthText;
  String transactionType;
  String Amount;
  FinancialSummaryCard({
    super.key,
    required this.transactionIcon,
    required this.smallContainer,
    required this.MonthText,
    required this.transactionType,
    required this.Amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(1, 1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
          bottom: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: smallContainer,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(transactionIcon, color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              transactionType,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              Amount,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.black38,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "This Month",
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: MonthText,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
