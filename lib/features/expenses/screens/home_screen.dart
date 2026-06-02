import 'package:expense_tracker_app/core/widgets/custome_ElevetedButton.dart';
import 'package:expense_tracker_app/features/expenses/screens/add_expense.dart';
import 'package:expense_tracker_app/features/expenses/screens/set_initial_balance.dart';

import 'package:expense_tracker_app/features/widgets/homescreen_widgets/HomeHeader.dart';
import 'package:expense_tracker_app/features/widgets/homescreen_widgets/balance_overview_card.dart';
import 'package:expense_tracker_app/features/widgets/homescreen_widgets/financial_summary_card.dart';
import 'package:expense_tracker_app/features/widgets/homescreen_widgets/home_screen_listTile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,

            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Column(
                children: [
                  // Top Row
                  HomeHeader(),
                  const SizedBox(height: 20),
                  // Main top Container
                  BalanceOverviewCard(),
                  const SizedBox(height: 10),
                  // FinancialSummry Card
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FinancialSummaryCard(
                        transactionIcon: Icons.arrow_downward,
                        smallContainer: Colors.green,
                        MonthText: Colors.green,
                        Amount: "3000,0.00",
                        transactionType: "Income",
                      ),
                      FinancialSummaryCard(
                        transactionIcon: Icons.arrow_upward,
                        smallContainer: Colors.redAccent,
                        MonthText: Colors.redAccent,
                        Amount: "2000,0.00",
                        transactionType: "Expense",
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Recent Expenseces
                  ExpenseListTile(),
                  AppElevatedButton(
                    ButtonText: "Set Initial Balance",
                    width: 350,
                    height: 50,
                    ContainerColor: Colors.blue,
                    borderRadius: 10,
                    TextColor: Colors.white,
                    fontSize: 18,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WalletScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          elevation: 5,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddExpense()),
            );
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
