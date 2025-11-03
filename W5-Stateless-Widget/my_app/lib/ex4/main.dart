import 'package:flutter/material.dart';
import '../widgets/WeatherCard.dart';
import 'data/weather.dart';

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
        backgroundColor: Colors.white,
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
        body: ListView(
          children: [
            Column(
              spacing: 10,
              // weather data from data file
              children: weatherData
                  .map(
                    (w) => WeatherCard(
                      city: w.city,
                      min: w.min,
                      max: w.max,
                      avg: w.avg,
                      type: w.type,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
