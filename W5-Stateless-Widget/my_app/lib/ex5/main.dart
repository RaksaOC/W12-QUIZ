import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("My App"), centerTitle: false),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 100),
            Container(height: 400, color: Colors.blue),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(height: 100, color: Colors.green),
                ),
                Container(width: 100, height: 100, color: Colors.pink),
              ],
            ),
            Row(  
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 20,
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.yellow,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.yellow,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(child: Container(color: Colors.pink)),
          ],
        ),
      ),
    );
  }
}
