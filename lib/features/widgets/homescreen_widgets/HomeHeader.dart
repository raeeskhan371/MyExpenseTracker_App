import 'package:expense_tracker_app/features/expenses/provider/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.indigo.shade100,
            ),
            child: Icon(Icons.person, color: Colors.indigo),
          ),
          SizedBox(width: 15),
          FutureBuilder(
            future: context.read<ExpenseProvider>().fetchingUserName(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text(
                  "Loading...",
                  style: GoogleFonts.poppins(color: Colors.indigo.shade400),
                );
              }
              if (snapshot.hasData == null || !snapshot.hasData) {
                return Text(
                  "No Name",
                  style: GoogleFonts.poppins(color: Colors.indigo.shade400),
                );
              }
              if (snapshot.hasError) {
                return Text(
                  "Some Thing Wrong.. 💤 ",
                  style: GoogleFonts.poppins(color: Colors.indigo.shade400),
                );
              }
              final userName = snapshot.data!;
              return Text(
                userName,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.indigo.shade400,
                  fontWeight: FontWeight.w700,
                ),
              );
            },
          ),
          Spacer(),
          Icon(Icons.notification_add_outlined),
        ],
      ),
    );
  }
}
