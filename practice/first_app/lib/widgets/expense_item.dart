import 'package:first_app/data/data.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  const ExpenseItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Column(
              children: [
                Text(expense.title),
                Text('${expense.price}'),
                Text(expense.category.name),
              ],
            ),
            Row(
              children: [
                Icon(expense.category.icon, size: 30),
                Text(expense.createdAt),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
