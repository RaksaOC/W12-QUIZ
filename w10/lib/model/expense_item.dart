import 'package:w_10/model/category.dart';

class ExpenseItemModel {
  final int id;
  final String name;
  final double price;
  final Category category;
  final DateTime createdAt;

  ExpenseItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.createdAt,
  });
}