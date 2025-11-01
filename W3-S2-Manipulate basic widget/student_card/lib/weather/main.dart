import 'package:flutter/material.dart';
import 'package:student_card/widgets/WeatherCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather App',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: false,
          backgroundColor: Colors.blue[700],
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
              color: Colors.white,
            ),
          ],
        ),
        body: Column(
          spacing: 10,
          children: [
            WeatherCard(
              city: 'Phnom Penh',
              min: 26.4,
              max: 36.1,
              avg: 31.2,
              icon: Icons.sunny,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFFB347), // warm orange
                  Color(0xFFFFCC33), // golden
                  Color(0xFFF75D59), // coral
                ],
              ),
              iconColor: Color(0xFFFFB347),
            ),
            WeatherCard(
              city: 'Takeo',
              min: 25.2,
              max: 34.8,
              avg: 29.9,
              icon: Icons.sunny,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF74EBD5), // light teal
                  Color(0xFFACB6E5), // soft blue
                  Color(0xFF3797FF), // vivid blue
                ],
              ),
              iconColor: Color(0xFF74EBD5),
            ),
            WeatherCard(
              city: 'Siem Reap',
              min: 22.9,
              max: 33.5,
              avg: 27.7,
              icon: Icons.cloud,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF11998E), // teal green
                  Color(0xFF38EF7D), // bright green
                  Color(0xFFA8FF78), // lime
                ],
              ),
              iconColor: Color(0xFF11998E),
            ),
            WeatherCard(
              city: 'Battambang',
              min: 24.0,
              max: 37.3,
              avg: 31.0,
              icon: Icons.sunny,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFFF5F6D), // pink red
                  Color(0xFFFFC371), // orange
                  Color(0xFFFFD194), // pale orange
                ],
              ),
              iconColor: Color(0xFFFF5F6D),
            ),
          ],
        ),
      ),
    );
  }
}
