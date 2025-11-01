import 'package:flutter/material.dart';
import 'package:my_app/widgets/ProductCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 20,
            children: [
              ProductCard(product: Product.dart),
              ProductCard(product: Product.flutter),
              ProductCard(product: Product.firebase),
            ],
          ),
        ),
      ),
    );
  }
}
