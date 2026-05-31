import 'package:expense_tracker_app/core/widgets/custome_Textfield.dart';
import 'package:expense_tracker_app/features/expenses/screens/add_screen/widgets/add_expense_topRow.dart';
import 'package:expense_tracker_app/features/expenses/screens/add_screen/widgets/category_item_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddExpense extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  AddExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // toprow Add Expenese
                AddExpenseToprow(),
                Text(
                  "Full Name",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),

                AppTextformField(
                  controller: titleController,
                  hintText: "eg.Coffe,Lunch...",
                  prefixIcon: Icons.title_rounded,
                ),
                const SizedBox(height: 30),
                Text(
                  "Amount",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),

                AppTextformField(
                  controller: amountController,
                  hintText: "Rs0.00",
                  prefixIcon: Icons.monetization_on,
                ),

                const SizedBox(height: 20),
                Text(
                  "Category",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryItemCard(
                      categoryText: "Food",
                      catergoryContainerColor: Colors.deepPurple.shade50,
                      SubCatergoryContainer: Colors.deepPurpleAccent,
                      catergoryIcon: Icons.restaurant,
                    ),
                    CategoryItemCard(
                      categoryText: "Transport",
                      catergoryContainerColor: Colors.deepPurple.shade50,
                      SubCatergoryContainer: Colors.blue,
                      catergoryIcon: Icons.directions_car,
                    ),
                    CategoryItemCard(
                      categoryText: "Shopping",
                      catergoryContainerColor: Colors.deepPurple.shade50,
                      SubCatergoryContainer: Colors.green,
                      catergoryIcon: Icons.shopping_bag_outlined,
                    ),
                    CategoryItemCard(
                      categoryText: "Bills",
                      catergoryContainerColor: Colors.deepPurple.shade50,
                      SubCatergoryContainer: Colors.orange,
                      catergoryIcon: Icons.receipt_long,
                    ),
                    CategoryItemCard(
                      categoryText: "Medical",
                      catergoryContainerColor: Colors.deepPurple.shade50,
                      SubCatergoryContainer: Colors.red,
                      catergoryIcon: Icons.medical_information,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
