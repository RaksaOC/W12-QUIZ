import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("HELLO")),
        body: Center(
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(1)),
                          color: Color.fromARGB(0, 39, 153, 39),
                        ),
                        child: Text("Hello 1"),
                      ),
                      Text("Hello 2"),
                      Text("Hello 3"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
