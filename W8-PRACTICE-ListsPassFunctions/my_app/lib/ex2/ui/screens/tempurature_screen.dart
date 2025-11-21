import 'package:flutter/material.dart';

class TempuratureScreen extends StatefulWidget {
  const TempuratureScreen({super.key, required this.onBack});
  final VoidCallback onBack;

  @override
  State<TempuratureScreen> createState() => _TempuratureScreenState();
}

class _TempuratureScreenState extends State<TempuratureScreen> {
  double cTemp = 0;
  double fTemp = 0;

  void handleCalculate() {
    setState(() {
      fTemp = cTemp * 1.8 + 32;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 48),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Tempurature in degrees",
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              onChanged: (value) => setState(() {
                cTemp = double.parse(value);
              }),
            ),
            Text(
              "Tempurature in fahrenheit: $fTemp",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            TextButton(
              onPressed: handleCalculate,
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.green,
              ),
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
            TextButton(
              onPressed: widget.onBack,
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.green,
              ),
              child: Text(
                "Back",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
