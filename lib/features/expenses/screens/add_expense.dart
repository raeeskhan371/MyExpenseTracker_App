import 'package:expense_tracker_app/core/widgets/custome_ElevetedButton.dart';
import 'package:expense_tracker_app/core/widgets/custome_Textfield.dart';
import 'package:expense_tracker_app/features/expenses/provider/expense_provider.dart';
import 'package:expense_tracker_app/features/widgets/add_expense_screen_widgtes/add_expense_topRow.dart';
import 'package:expense_tracker_app/features/widgets/add_expense_screen_widgtes/category_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddExpense extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final VoidCallback onExpenseAdd;
  AddExpense({super.key, required this.onExpenseAdd});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // toprow Add Expenese
                  AddExpenseToprow(topTrowText: "Add Expense"),
                  const SizedBox(height: 20),
                  Text(
                    "Title",
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
                    textInputType: TextInputType.number,
                    inputformatter: [FilteringTextInputFormatter.digitsOnly],
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
                        categoryText: "Other",
                        catergoryContainerColor: Colors.deepPurple.shade50,
                        SubCatergoryContainer: Colors.grey,
                        catergoryIcon: Icons.more_horiz,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Text(
                    "Notes (Optional)",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),

                  GestureDetector(
                    onTap: () {},
                    child: TextField(
                      readOnly: false,
                      controller: notesController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 70),
                        hintText: "Add note....",

                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Icon(Icons.note_alt, size: 28),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  const SizedBox(height: 20),

                  const SizedBox(height: 20),
                  AppElevatedButton(
                    ButtonText: "Save Expense",
                    width: double.infinity,
                    height: 55,
                    ContainerColor: Colors.indigoAccent,
                    borderRadius: 10,
                    TextColor: Colors.white,
                    fontSize: 20,
                    onPressed: () async {
                      await context.read<ExpenseProvider>().addExpenses(
                        title: titleController.text,
                        amount:
                            double.tryParse(amountController.text.toString()) ??
                            0.00,
                        note: notesController.text,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Add Expense Successfully!"),
                          backgroundColor: Colors.blue,
                        ),
                      );
                      onExpenseAdd();
                    },
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
