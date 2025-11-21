import 'package:flutter/material.dart';
import 'package:my_app/ex2/ui/screens/welcome_screen.dart';
import 'package:my_app/ex2/ui/screens/tempurature_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  bool isWelcomeScreen = true;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: widget.isWelcomeScreen
          ? WelcomeScreen(
              onPressed: () {
                setState(() {
                  widget.isWelcomeScreen = !widget.isWelcomeScreen;
                });
              },
            )
          : TempuratureScreen(
              onBack: () {
                setState(() {
                  widget.isWelcomeScreen = !widget.isWelcomeScreen;
                });
              },
            ),
    );
  }
}
