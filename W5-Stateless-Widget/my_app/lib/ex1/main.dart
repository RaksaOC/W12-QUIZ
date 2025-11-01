import 'package:flutter/material.dart';
import '../widgets/HobbyCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("My Hobbies"), centerTitle: false),
        backgroundColor: Colors.grey,
        body: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 10,
            children: [
              HobbyCard(
                icon: Icons.search,
                text: "Traveling",
                color: Colors.green,
              ),
              HobbyCard(
                icon: Icons.hiking_rounded,
                text: "Skating",
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
