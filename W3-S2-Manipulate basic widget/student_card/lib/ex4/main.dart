import 'package:flutter/material.dart';
import 'package:student_card/widgets/button.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          children: [
            Button.gradient(
              text: "OOP",
              from: Colors.blue[100]!,
              to: const Color.fromARGB(255, 11, 36, 56)!,
            ),
            Button.gradient(
              text: "DART",
              from: const Color.fromARGB(255, 246, 229, 100)!,
              to: Colors.blue[400]!,
            ),
            Button.gradient(
              text: "FLUTTER",
              from: Colors.blue[400]!,
              to: const Color.fromARGB(255, 203, 222, 238)!,
            ),
            Button.solid(text: "RONAN", solidColor: Colors.blue[400]!),
            Button.solid(text: "IS", solidColor: Colors.blue[600]!),
            Button.solid(text: "BEST", solidColor: Colors.blue[700]!),
          ],
        ),
      ),
    ),
  );
}
