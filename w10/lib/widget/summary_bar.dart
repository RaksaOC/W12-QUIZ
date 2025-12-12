import 'package:flutter/material.dart';
import 'package:w_10/model/expense_item.dart';
import 'package:w_10/model/expense_summary.dart';
import 'package:w_10/widget/summary_card.dart';
import 'package:w_10/model/category.dart';

class SummaryBar extends StatefulWidget {
  final List<ExpenseItemModel> items;

  SummaryBar({required this.items});

  @override
  State<SummaryBar> createState() => _SummaryBarState();
}

class _SummaryBarState extends State<SummaryBar> {
  List<ExpenseSummaryModel> getCardData() {
    final Map<Category, double> categoryTotals = <Category, double>{};

    for (var item in widget.items) {
      final price = item.price;
      categoryTotals[item.category] =
          (categoryTotals[item.category] ?? 0.0) + price;
    }

    // Convert to list of StatSummaryType
    return categoryTotals.entries.map((entry) {
      return ExpenseSummaryModel(category: entry.key, price: entry.value);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final cardData = getCardData();

    if (cardData.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: cardData
            .map((item) => SummaryCard(summaryItem: item))
            .toList(),
      ),
    );
  }
}
