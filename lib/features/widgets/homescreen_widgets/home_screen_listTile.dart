import 'package:expense_tracker_app/features/expenses/provider/expense_provider.dart';
import 'package:flutter/material.dart';
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

      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
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
              return ListTile(
                leading: CircleAvatar(backgroundColor: Colors.green),
                title: Text(data["title"] ?? 0),
                subtitle: Text(data["category"] ?? 0),
                trailing: Text(data["amount"].toString()),
              );
            },
          );
        },
      ),
    );
  }
}
