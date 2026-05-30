import 'package:expense_tracker_app/features/expenses/screens/home_screen/widgets/HomeHeader.dart';
import 'package:expense_tracker_app/features/expenses/screens/home_screen/widgets/balance_overview_card.dart';
import 'package:expense_tracker_app/features/expenses/screens/home_screen/widgets/financial_summary_card.dart';
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
                  Container(
                    height: 350,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Expanded(
                      child: ListView.separated(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.green,
                            ),
                            title: Text("Raees Khan"),
                            subtitle: Text("Amount 1000"),
                            trailing: Icon(Icons.delete, color: Colors.red),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
