import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String label;
  final String? placeholder;
  final void Function(String) onChanged;

  const AppInput({
    super.key,
    required this.label,
    required this.onChanged,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: placeholder,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.5),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          fillColor: Colors.grey.shade100,
          filled: true,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
