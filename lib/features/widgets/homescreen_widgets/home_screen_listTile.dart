import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/features/expenses/provider/expense_provider.dart';
import 'package:expense_tracker_app/features/expenses/screens/update_expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ExpenseListTile extends StatefulWidget {
  const ExpenseListTile({super.key});

  @override
  State<ExpenseListTile> createState() => _ExpenseListTileState();
}

class _ExpenseListTileState extends State<ExpenseListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: StreamBuilder(
        stream: context.read<ExpenseProvider>().getExpneseTileData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(color: Colors.blue);
          }
          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;
              final expenseId = docs[index].id;

              final dateTime = (data["createdAt"] as Timestamp).toDate();
              final fromateData = DateFormat("dd/MM/yyyy").format(dateTime);

              return Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 0),
                      blurRadius: 12,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 180,

                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.orange,
                                      radius: 25,
                                    ),
                                    SizedBox(width: 15),
                                    Column(
                                      children: [
                                        Text(
                                          data["title"].toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                        Text(
                                          fromateData,
                                          style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        // Text(
                                        //   data["note"].toString(),
                                        //   style: GoogleFonts.poppins(
                                        //     fontSize: 16,
                                        //     fontWeight: FontWeight.w700,
                                        //     color: Colors.grey.shade700,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 100,
                          width: 180,

                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "- ${data["amount"].toString()}",
                                  style: GoogleFonts.poppins(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => UpdateExpense(
                                              title: data["title"],
                                              expenseId: expenseId,
                                              amount: data["amount"],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.edit_outlined,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () async {
                                        await context
                                            .read<ExpenseProvider>()
                                            .deleteExpense(id: expenseId);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.redAccent.withOpacity(
                                            0.1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
