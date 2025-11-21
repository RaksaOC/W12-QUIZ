import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.onPressed});
  final VoidCallback onPressed;
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.cyan],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.thermostat, size: 200, color: Colors.white),
            Text("Welcome !", style: TextStyle(color: Colors.white)),
            TextButton(
              onPressed: widget.onPressed,
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.green,
              ),
              child: Text(
                "Start to convert!",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
