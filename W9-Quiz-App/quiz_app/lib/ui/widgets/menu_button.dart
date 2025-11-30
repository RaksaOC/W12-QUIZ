import 'package:flutter/material.dart';
import 'package:quiz_app/ui/quiz_app.dart';

class MenuButton extends StatelessWidget {
  final Pages page;
  final void Function(String) onPressed;
  const MenuButton({super.key, required this.page, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: page.backgroundColor,
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onPressed: () => onPressed(page.id),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Icon(page.icon, size: 20)),
          Text(
            page.title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
