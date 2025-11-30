import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

enum Category {
  food(Icons.fastfood),
  travel(Icons.flight_takeoff),
  leisure(Icons.movie),
  work(Icons.work),
  other(Icons.device_unknown);

  final IconData icon;

  const Category(this.icon);
}

class Expense {
  final String title;
  final double price;
  final Category category;
  final String createdAt;
  const Expense({
    required this.title,
    required this.price,
    required this.category,
    required this.createdAt,
  });
}

List<Expense> expenses = [
  Expense(
    title: 'Food',
    price: 100,
    category: Category.food,
    createdAt: intl.DateFormat(
      'dd/MM/yyyy',
    ).format(DateTime.now().subtract(const Duration(days: 0))),
  ),
  Expense(
    title: 'Travel',
    price: 200,
    category: Category.travel,
    createdAt: intl.DateFormat(
      'dd/MM/yyyy',
    ).format(DateTime.now().subtract(const Duration(days: 1))),
  ),
  Expense(
    title: 'Leisure',
    price: 300,
    category: Category.leisure,
    createdAt: intl.DateFormat(
      'dd/MM/yyyy',
    ).format(DateTime.now().subtract(const Duration(days: 2))),
  ),
  Expense(
    title: 'Work',
    price: 400,
    category: Category.work,
    createdAt: intl.DateFormat(
      'dd/MM/yyyy',
    ).format(DateTime.now().subtract(const Duration(days: 3))),
  ),
  Expense(
    title: 'Other',
    price: 500,
    category: Category.other,
    createdAt: intl.DateFormat(
      'dd/MM/yyyy',
    ).format(DateTime.now().subtract(const Duration(days: 4))),
  ),
];
