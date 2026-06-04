import 'package:expense_tracker_app/core/widgets/custome_ElevetedButton.dart';
import 'package:expense_tracker_app/features/expenses/provider/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatelessWidget {
  final TextEditingController setBalanceController = TextEditingController();
  WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Wallet"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "Set Your ",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " Initial Balance",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller: setBalanceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter initial balance",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            AppElevatedButton(
              ButtonText: "Set Initial Balance",
              width: 350,
              height: 50,
              ContainerColor: Colors.blue,
              borderRadius: 10,
              TextColor: Colors.white,
              fontSize: 18,
              onPressed: () async {
                final balance = double.tryParse(setBalanceController.text) ?? 0;
                await context.read<ExpenseProvider>().setBalance(
                  balance: balance,
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
