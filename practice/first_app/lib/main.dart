import 'package:first_app/data/data.dart';
import 'package:first_app/widgets/expense_item.dart';
import 'package:flutter/material.dart';

void main() {
  List<Expense> registeredExpenses = expenses;
  bool isBottomSheetOpen = false;
  void handleOnPress() {}
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("EXPENSES"),
          actions: [
            TextButton(child: (Icon(Icons.add)), onPressed: handleOnPress),
          ],
        ),
        backgroundColor: Colors.blue,
        body: Column(
          children: registeredExpenses
              .map((expense) => ExpenseItem(expense: expense))
              .toList(),
        ),
      ),
    ),
  );
}
