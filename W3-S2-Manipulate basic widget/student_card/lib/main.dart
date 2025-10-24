import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App -- Hello world')),
        body: Center(
          child: Text(
            'Hello my name is Raksa!',
            style: TextStyle(color: Colors.orange, fontSize: 50),
          ),
        ),
      ),
    ),
  );
}