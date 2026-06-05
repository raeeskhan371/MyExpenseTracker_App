import 'package:expense_tracker_app/core/widgets/custome_ElevetedButton.dart';
import 'package:expense_tracker_app/features/expenses/screens/add_expense.dart';
import 'package:expense_tracker_app/features/expenses/screens/set_initial_balance.dart';
import 'package:expense_tracker_app/features/widgets/homescreen_widgets/HomeHeader.dart';
import 'package:expense_tracker_app/features/widgets/homescreen_widgets/balance_overview_card.dart';
import 'package:expense_tracker_app/features/widgets/homescreen_widgets/financial_summary_card.dart';
import 'package:expense_tracker_app/features/widgets/homescreen_widgets/home_screen_listTile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
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

                  const SizedBox(height: 10),

                  // Recent Expenseces
                  ExpenseListTile(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
