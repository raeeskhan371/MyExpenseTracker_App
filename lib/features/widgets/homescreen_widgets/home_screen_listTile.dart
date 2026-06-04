import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/features/expenses/provider/expense_provider.dart';
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
          final docs = snapshot.data!.docs;

          if (!snapshot.hasData) {
            return CircularProgressIndicator(color: Colors.blue);
          }

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;
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
                        Container(
                          height: 100,
                          width: 180,

                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(backgroundColor: Colors.orange),
                                const SizedBox(height: 10),
                                Text(
                                  fromateData,
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Container(
                          height: 100,
                          width: 180,

                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  data["amount"].toString(),
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Spacer(),
                                    Icon(Icons.edit, color: Colors.blue),
                                    const SizedBox(width: 10),
                                    Icon(Icons.delete, color: Colors.red),
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
