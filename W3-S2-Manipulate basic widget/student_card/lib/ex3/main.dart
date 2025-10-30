import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.grey),
        child: Column(
          spacing: 20,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.blue[100]!,
              ),
              child: Center(
                child: Text(
                  "OOP",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.blue[300]!,
              ),
              child: Center(
                child: Text(
                  "DART",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                gradient: LinearGradient(
                  colors: [
                    Colors.blue[500]!,
                    const Color.fromARGB(255, 4, 16, 33),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  "FLUTTER",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
