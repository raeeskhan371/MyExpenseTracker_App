import 'package:expense_tracker_app/features/expenses/provider/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BalanceOverviewCard extends StatelessWidget {
  const BalanceOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ExpenseProvider>();
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
                FutureBuilder(
                  future: context.read<ExpenseProvider>().userReamingBalance(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    if (!snapshot.hasData || snapshot.data == null) {
                      return Text("No Data");
                    }
                    var balance = snapshot.data;

                    return Text(
                      balance.toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    );
                  },
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
