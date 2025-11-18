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
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(color: (Colors.blue)),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(color: (Colors.yellow)),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: (Colors.blue)),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(color: (Colors.blue)),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(color: (Colors.yellow)),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.green),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.orange),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
