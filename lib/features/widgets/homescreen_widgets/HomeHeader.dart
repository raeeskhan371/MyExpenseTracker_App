import 'package:expense_tracker_app/features/auth/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileFormScreen()),
              );
            },

            child: Icon(Icons.menu),
          ),
          SizedBox(width: 15),
          Text(
            "Home",
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
          Icon(Icons.notification_add_outlined),
        ],
      ),
    );
  }
}
