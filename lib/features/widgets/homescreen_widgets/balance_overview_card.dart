import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceOverviewCard extends StatelessWidget {
  const BalanceOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,

      decoration: BoxDecoration(
        color: Colors.indigo.shade400,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total balance;
            Row(
              children: [
                Text(
                  "Total Balance ",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
            // Balance And Wallet Icon
            Row(
              children: [
                Text(
                  "Rs 12,450.00 ",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Spacer(),
                Container(
                  height: 60,
                  width: 60,

                  decoration: BoxDecoration(
                    color: Colors.indigo.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.wallet_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              "This Month ",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
