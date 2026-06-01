import 'package:flutter/material.dart';

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
      child: Expanded(
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(backgroundColor: Colors.green),
              title: Text("Raees Khan"),
              subtitle: Text("Amount 1000"),
              trailing: SizedBox(
                width: 50,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.delete, color: Colors.red),
                    Icon(Icons.edit, color: Colors.blue),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
