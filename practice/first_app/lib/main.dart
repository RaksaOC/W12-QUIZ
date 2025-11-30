import 'package:first_app/data/data.dart';
import 'package:first_app/widgets/expense_item.dart';
import 'package:flutter/material.dart';

void main() {
  List<Expense> registeredExpenses = expenses;
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("EXPENSES")),
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
