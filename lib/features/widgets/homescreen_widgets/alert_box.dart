import 'package:expense_tracker_app/features/expenses/provider/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppAlertBox extends StatelessWidget {
  const AppAlertBox({super.key, required this.expenseId});

  final String expenseId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete expense ?", style: GoogleFonts.poppins(fontSize: 18)),
      content: Text("Are you sure you want to delete this expense?"),
      actions: [
        TextButton(
          onPressed: () async {
            await context.read<ExpenseProvider>().deleteExpense(id: expenseId);
            Navigator.pop(context);
          },
          child: Text("Confirm"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
      ],
    );
  }
}
