import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// apna custom widget import karo
import 'package:expense_tracker_app/core/widgets/custome_Textfield.dart';

class ProfileFormScreen extends StatelessWidget {
  ProfileFormScreen({super.key});

  // dummy controllers (sirf UI ke liye)
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final balanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // ICON
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.person, size: 45, color: Colors.blue),
                ),

                const SizedBox(height: 15),

                // TITLE
                Text(
                  "Profile Form",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "Fill your profile details",
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                ),

                const SizedBox(height: 30),

                // NAME
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Full Name",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 5),

                AppTextformField(
                  controller: nameController,
                  hintText: "Enter your name",
                  prefixIcon: Icons.person,
                ),

                const SizedBox(height: 15),

                // EMAIL
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 5),

                AppTextformField(
                  controller: emailController,
                  hintText: "Enter your email",
                  prefixIcon: Icons.mail,
                ),

                const SizedBox(height: 15),

                // INITIAL BALANCE
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Initial Balance",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 5),

                AppTextformField(
                  controller: balanceController,
                  hintText: "Enter starting balance",
                  prefixIcon: Icons.account_balance_wallet,
                ),

                const SizedBox(height: 30),

                // SAVE BUTTON (DUMMY)
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Profile Saved (Dummy)"),
                          backgroundColor: Colors.blue,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "SAVE PROFILE",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
