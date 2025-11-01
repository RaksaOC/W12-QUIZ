import 'package:flutter/material.dart';
import 'package:my_app/widgets/Button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Custom Buttons"), centerTitle: false),
        backgroundColor: Colors.white,
        body: Column(
          spacing: 20,
          children: [
            Button(
              type: ButtonType.primary,
              orderType: ButtonOrderType.iconFirst,
              text: "Submit",
              icon: Icons.check,
            ),
            Button(
              type: ButtonType.secondary,
              orderType: ButtonOrderType.textFirst,
              text: "Cancel",
              icon: Icons.cancel,
            ),
            Button(
              type: ButtonType.disabled,
              orderType: ButtonOrderType.iconFirst,
              text: "Account",
              icon: Icons.account_circle,
            ),
          ],
        ),
      ),
    );
  }
}
