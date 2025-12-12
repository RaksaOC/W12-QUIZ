import 'package:flutter/material.dart';
import 'package:w_10/model/category.dart';

IconData getIcon(Category category) {
    switch (category) {
      case Category.food:
        return Icons.restaurant;
      case Category.drink:
        return Icons.local_drink;
      case Category.other:
        return Icons.category;
      case Category.transport:
        return Icons.directions_bus;
      case Category.groceries:
        return Icons.shopping_cart;
      case Category.clothes:
        return Icons.shopping_bag;
      case Category.bills:
        return Icons.receipt;
      case Category.healthcare:
        return Icons.health_and_safety;
      case Category.education:
        return Icons.school;
      case Category.entertainment:
        return Icons.movie;
      case Category.travel:
        return Icons.flight_takeoff;
      case Category.personalCare:
        return Icons.person;
      case Category.fitness:
        return Icons.fitness_center;
      case Category.insurance:
        return Icons.security;
      case Category.rent:
        return Icons.home;
      case Category.electronics:
        return Icons.laptop;
      case Category.pets:
        return Icons.pets;
      case Category.gifts:
        return Icons.card_giftcard;
      case Category.kids:
        return Icons.child_care;
      case Category.savings:
        return Icons.savings;
      case Category.taxes:
        return Icons.money;
      case Category.donations:
        return Icons.card_giftcard;
      case Category.subscriptions:
        return Icons.subscriptions;
      case Category.home:
        return Icons.home;
      case Category.business:
        return Icons.business;
    }
  }