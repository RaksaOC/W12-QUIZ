import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.all(50),
        decoration: BoxDecoration(color: Colors.white),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[300],
          ),
          padding: EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                "ORY CHANRAKSA",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
