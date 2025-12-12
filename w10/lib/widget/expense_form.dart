import 'package:flutter/material.dart';
import 'package:w_10/model/category.dart';
import 'package:w_10/widget/date_time_picker.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({
    super.key,
    required this.onCreate,
    required this.onCancel,
  });

  final void Function(String, double, Category, DateTime) onCreate;
  final VoidCallback onCancel;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  String nameValue = '';
  double priceValue = 0.0;
  Category categoryValue = Category.values.first;
  DateTime? selectedDate;
  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add New Expense',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => widget.onCancel(),
                icon: Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Item Name',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.shopping_bag),
            ),
            onChanged: (text) => setState(() => nameValue = text),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _priceController,
            decoration: const InputDecoration(
              labelText: 'Price',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.attach_money),
            ),
            keyboardType: TextInputType.number,
            onChanged: (text) =>
                setState(() => priceValue = double.parse(text)),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: categoryValue.name,
            decoration: const InputDecoration(
              labelText: 'Category',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.category),
            ),
            items: Category.values
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item.name,
                    child: Text(
                      item.name[0].toUpperCase() + item.name.substring(1),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(
                () => categoryValue = Category.values.firstWhere(
                  (cat) => cat.name == value,
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          DateTimePicker(
            selectedDate: selectedDate,
            onDateSelected: (date) => setState(() => selectedDate = date),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  _nameController.clear();
                  _priceController.clear();
                  setState(() {
                    nameValue = '';
                    priceValue = 0.0;
                    categoryValue = Category.values.first;
                    selectedDate = null;
                  });
                },
                child: const Text('Clear'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () => widget.onCancel(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black87,
                ),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  final nameText = _nameController.text.trim();
                  final priceText = _priceController.text.trim();
                  final price = double.tryParse(priceText);
                  if (nameText.isEmpty ||
                      price == null ||
                      price <= 0 ||
                      categoryValue.name.isEmpty ||
                      selectedDate == null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text(
                          'Please fill in all fields before creating an expense.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Validate price is a valid number
                    final price = double.tryParse(priceText);
                    if (price == null || price <= 0) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Error'),
                          content: const Text(
                            'Please enter a valid price (positive number).',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      widget.onCreate(
                        nameValue,
                        priceValue,
                        categoryValue,
                        selectedDate!,
                      );
                    }
                  }
                },
                child: const Text('Create'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
