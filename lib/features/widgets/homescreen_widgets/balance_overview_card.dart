import 'package:expense_tracker_app/features/expenses/provider/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BalanceOverviewCard extends StatefulWidget {
  const BalanceOverviewCard({super.key});

  @override
  State<BalanceOverviewCard> createState() => _BalanceOverviewCardState();
}

class _BalanceOverviewCardState extends State<BalanceOverviewCard> {
  bool isBalanceVisibale = true;
  @override
  Widget build(BuildContext context) {
    print("Only Balance OverCard Rebuild");

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

                IconButton(
                  onPressed: () {
                    setState(() {
                      isBalanceVisibale = !isBalanceVisibale;
                    });
                  },
                  icon: Icon(
                    isBalanceVisibale
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
            // Balance And Wallet Icon
            Row(
              children: [
                StreamBuilder(
                  stream: context.read<ExpenseProvider>().userReamingBalance(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(color: Colors.white);
                    }

                    if (!snapshot.hasData || snapshot.data == null) {
                      return Text(
                        "0.00",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      );
                    }
                    var balance = snapshot.data;
                    return Text(
                      isBalanceVisibale ? balance.toString() : "****",
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    );
                  },
                ),
                const SizedBox(width: 5),

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
