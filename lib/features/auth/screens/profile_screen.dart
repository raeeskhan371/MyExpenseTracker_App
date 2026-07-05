import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/core/widgets/custome_ElevetedButton.dart';
import 'package:expense_tracker_app/core/widgets/custome_Textfield.dart';
import 'package:expense_tracker_app/features/auth/provider/auth_user_provider.dart';
import 'package:expense_tracker_app/features/expenses/screens/set_initial_balance.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfileFormScreen extends StatelessWidget {
  const ProfileFormScreen({super.key});
  //// Profile Forme Screeen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

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
                  child: Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.indigo.shade400,
                  ),
                ),

                const SizedBox(height: 15),

                // TITLE
                Text(
                  "Profile Detail",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "Your account information",
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
                FutureBuilder(
                  future: context.read<AuthProvider>().getProfileData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator(
                        color: Colors.blue,
                      );
                    }

                    final doc = snapshot.data?.data() as Map<String, dynamic>?;

                    final name = doc?["name"];

                    return AppTextformField(
                      hintText: (name != null && name.toString().isNotEmpty)
                          ? name.toString()
                          : "No name found",
                      prefixIcon: Icons.person_2,
                      readOnly: true,
                    );
                  },
                ),
                const SizedBox(height: 15),

                // EMAIL
                const SizedBox(height: 5),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 5),

                FutureBuilder(
                  future: context.read<AuthProvider>().getProfileData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator(
                        color: Colors.blue,
                      );
                    }

                    final doc = snapshot.data?.data() as Map<String, dynamic>?;

                    final email = doc?["email"];

                    return AppTextformField(
                      hintText: (email != null && email.toString().isNotEmpty)
                          ? email.toString()
                          : "No email found",
                      prefixIcon: Icons.mail,
                      readOnly: true,
                    );
                  },
                ),

                const SizedBox(height: 15),

                // INITIAL BALANCE
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Balance",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 5),

                FutureBuilder(
                  future: context.read<AuthProvider>().getProfileData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator(
                        color: Colors.blue,
                      );
                    }

                    final doc = snapshot.data?.data() as Map<String, dynamic>?;

                    final rawBalance = doc?["initialBalance"];

                    final balance = (rawBalance is num)
                        ? rawBalance
                        : double.tryParse(rawBalance.toString()) ?? 0;

                    final formatter = NumberFormat('#,##0');
                    final formattedBalance = formatter.format(balance);

                    return AppTextformField(
                      hintText: formattedBalance,
                      prefixIcon: Icons.account_balance_wallet_outlined,
                      readOnly: true,
                    );
                  },
                ),

                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Created At",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 5),

                FutureBuilder(
                  future: context.read<AuthProvider>().getProfileData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator(
                        color: Colors.blue,
                      );
                    }

                    final doc = snapshot.data?.data() as Map<String, dynamic>?;

                    if (doc == null) {
                      return const CircularProgressIndicator();
                    }

                    final createdAt = doc["createdAt"];

                    if (createdAt == null || createdAt is! Timestamp) {
                      return AppTextformField(
                        hintText: "No date available",
                        prefixIcon: Icons.date_range_outlined,
                        readOnly: true,
                      );
                    }

                    final dateTime = createdAt.toDate();

                    final formatDate = DateFormat(
                      "dd/MM/yyyy, hh:mm a",
                    ).format(dateTime);

                    return AppTextformField(
                      hintText: formatDate,
                      prefixIcon: Icons.date_range_outlined,
                      readOnly: true,
                    );
                  },
                ),

                const SizedBox(height: 20),
                AppElevatedButton(
                  ButtonText: "Logout",
                  width: double.infinity,
                  height: 60,
                  ContainerColor: Colors.indigo.shade400,
                  borderRadius: 10,
                  TextColor: Colors.white,
                  fontSize: 24,
                  onPressed: () {
                    context.read<AuthProvider>().logout();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo.shade400,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WalletScreen(setInitialBalance: () {}),
            ),
          );
        },
        child: Center(child: Icon(Icons.add, color: Colors.white)),
      ),
    );
  }
}
