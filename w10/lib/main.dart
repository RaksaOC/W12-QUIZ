import 'package:flutter/material.dart';
import 'package:w_10/model/expense_item.dart';
import 'package:w_10/widget/expense_item.dart';
import 'package:w_10/widget/summary_bar.dart';
import 'package:w_10/widget/expense_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ronan\'s Expense Tracker',
      home: MyHomePage(title: 'Ronan\'s Expense Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ExpenseItemModel> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ExpenseForm(
                    onCreate:
                        (nameValue, priceValue, categoryValue, selectedDate) {
                          setState(() {
                            items.add(
                              ExpenseItemModel(
                                id: items.length + 1,
                                name: nameValue,
                                price: priceValue,
                                category: categoryValue,
                                createdAt: selectedDate,
                              ),
                            );
                          });
                          Navigator.of(context).pop();
                        },
                    onCancel: () {
                      Navigator.of(context).pop();
                    },
                  );
                },
              );
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Column(
        children: [
          SummaryBar(items: items),
          Expanded(
            child: items.isEmpty
                ? const Center(child: Text('No items yet'))
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ExpenseItem(
                        expenseItem: items[index],
                        onDismiss: (id) {
                          setState(() {
                            items.removeAt(index);
                          });
                        },
                        onUndo: (expenseItem) {
                          setState(() {
                            items.add(expenseItem);
                          });
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
