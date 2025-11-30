import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(this.label, {super.key, required this.onPressed, this.icon});

  final IconData? icon;
  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon != null ? Icon(icon) : null,
      label: Text(label),
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      ),
    );
  }
}
