import 'package:flutter/material.dart';
import 'package:w_10/model/category.dart';
import 'package:w_10/model/expense_item.dart';
import 'package:w_10/utils/getIcon.dart';

class ExpenseItem extends StatelessWidget {
  final ExpenseItemModel expenseItem;
  final void Function(int) onDismiss;
  final void Function(ExpenseItemModel) onUndo;

  const ExpenseItem({
    super.key,
    required this.expenseItem,
    required this.onDismiss,
    required this.onUndo,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(expenseItem.name),
      background: Container(
        padding: EdgeInsets.only(right: 20, left: 20),
        margin: EdgeInsets.only(right: 20, left: 20),
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Icon(Icons.delete, color: Colors.white)],
        ),
      ),
      onDismissed: (direction) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${expenseItem.name} dismissed'),
            duration: const Duration(seconds: 2),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                onUndo(expenseItem);
              },
            ),
          ),
        );
        onDismiss(expenseItem.id);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 2,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Icon(
              getIcon(expenseItem.category),
              color: Theme.of(context).primaryColor,
            ),
          ),
          title: Text(
            expenseItem.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            expenseItem.category.name[0].toUpperCase() +
                expenseItem.category.name.substring(1),
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
          trailing: Text(
            '\$ ${expenseItem.price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
