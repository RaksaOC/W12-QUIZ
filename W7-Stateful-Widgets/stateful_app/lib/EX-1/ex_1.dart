import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: SizedBox(
          width: 400,
          height: 300,
          child: Column(
            spacing: 20,
            // for loop to create 3 buttons (key is optional just wanna try)
            children: List.generate(3, (index) => Button(key: ValueKey(index))),
          ),
        ),
      ),
    ),
  ),
);

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isSelected = false;

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: toggleSelection,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue[500]! : Colors.blue[50]!,
        foregroundColor: Colors.black,
        textStyle: const TextStyle(fontSize: 24),
      ),
      child: Center(child: Text(isSelected ? 'Selected' : 'Not Selected')),
    );
  }
}
