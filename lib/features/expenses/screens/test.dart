import 'package:flutter/material.dart';

class DismissibleTestingScreen extends StatefulWidget {
  const DismissibleTestingScreen({super.key});

  @override
  State<DismissibleTestingScreen> createState() =>
      _DismissibleTestingScreenState();
}

class _DismissibleTestingScreenState extends State<DismissibleTestingScreen> {
  final List<String> expenses = [
    'Food',
    'Shopping',
    'Transport',
    'Netflix',
    'Gym',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dismissible Testing')),

      body: ListView.builder(
        itemCount: expenses.length,

        itemBuilder: (context, index) {
          final expense = expenses[index];

          return Dismissible(
            key: ValueKey(expense),

            background: Container(
              alignment: Alignment.centerLeft,

              padding: const EdgeInsets.symmetric(horizontal: 20),

              color: Colors.blue,

              child: const Icon(Icons.edit, color: Colors.white),
            ),

            secondaryBackground: Container(
              alignment: Alignment.centerRight,

              padding: const EdgeInsets.symmetric(horizontal: 20),

              color: Colors.red,

              child: const Icon(Icons.delete, color: Colors.white),
            ),

            confirmDismiss: (direction) async {
              // RIGHT SWIPE → EDIT
              if (direction == DismissDirection.startToEnd) {
                final controller = TextEditingController(text: expense);

                final updatedExpense = await showDialog<String>(
                  context: context,

                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Edit Expense'),

                      content: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: 'Enter expense name',
                        ),
                      ),

                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },

                          child: const Text('Cancel'),
                        ),

                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, controller.text);
                          },

                          child: const Text('Save'),
                        ),
                      ],
                    );
                  },
                );

                if (updatedExpense != null && updatedExpense.isNotEmpty) {
                  setState(() {
                    expenses[index] = updatedExpense;
                  });
                }

                return false;
              }

              // LEFT SWIPE → DELETE
              return await showDialog(
                context: context,

                builder: (context) {
                  return AlertDialog(
                    title: const Text('Delete Expense?'),

                    content: Text('Delete $expense?'),

                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },

                        child: const Text('Cancel'),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },

                        child: const Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },

            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                setState(() {
                  expenses.removeAt(index);
                });

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('$expense deleted')));
              }
            },

            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.money)),

                title: Text(expense),

                subtitle: const Text('Right swipe = Edit\nLeft swipe = Delete'),
              ),
            ),
          );
        },
      ),
    );
  }
}
