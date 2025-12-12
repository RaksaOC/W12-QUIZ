import 'package:flutter/material.dart';
import 'package:w_10/model/expense_summary.dart';
import 'package:w_10/utils/getIcon.dart';

class SummaryCard extends StatelessWidget {
  final ExpenseSummaryModel summaryItem;

  const SummaryCard({super.key, required this.summaryItem});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                getIcon(summaryItem.category),
                size: 32,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 8),
              Text(
                '\$${summaryItem.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                summaryItem.category.name[0].toUpperCase() +
                    summaryItem.category.name.substring(1),
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
