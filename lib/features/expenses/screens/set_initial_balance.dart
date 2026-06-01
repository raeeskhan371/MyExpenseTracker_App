import 'package:expense_tracker_app/core/widgets/custome_ElevetedButton.dart';
import 'package:expense_tracker_app/features/expenses/provider/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatelessWidget {
  final TextEditingController setBalanceController = TextEditingController();
  WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wallet")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
