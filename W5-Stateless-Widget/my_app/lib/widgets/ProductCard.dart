import 'package:flutter/material.dart';

enum Product {
  dart(
    "Dart",
    "Dart is a programming language for building web applications.",
    "assets/images/dart.png",
  ),
  flutter(
    "Flutter",
    "Flutter is a framework for building mobile applications.",
    "assets/images/flutter.png",
  ),
  firebase(
    "Firebase",
    "Firebase is a backend as a service for building web applications.",
    "assets/images/firebase.png",
  );

  final String title;
  final String description;
  final String image;

  const Product(this.title, this.description, this.image);
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(product.image, width: 50,),
          Text(
            product.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(product.description),
        ],
      ),
    );
  }
}
