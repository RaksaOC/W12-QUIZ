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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.thermostat, size: 120, color: Colors.white),
            const SizedBox(height: 16),
            Text(
              "Converter",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 36),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Temperature in degrees",
                labelStyle: TextStyle(color: Colors.black54, fontSize: 14),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.white, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
              ),
              style: TextStyle(color: Colors.black87, fontSize: 16),
              onChanged: (value) => setState(() {
                cTemp = double.tryParse(value) ?? 0;
              }),
            ),
            const SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.white, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Temperature in Fahrenheit",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    fTemp.toStringAsFixed(1),
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
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
