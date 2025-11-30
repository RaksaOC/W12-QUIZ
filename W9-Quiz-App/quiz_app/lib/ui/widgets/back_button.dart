import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AppBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(onPressed: onPressed, child: Icon(Icons.arrow_back)),
        Text(
          "Back",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
