import 'package:flutter/material.dart';
import '../widgets/WeatherCard.dart';

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
        body: ListView(
          children: [
            Column(
              spacing: 10,
              children: [
                // AI assisted in locations and realistic temperatures
                WeatherCard(
                  city: 'New York',
                  min: 13.2,
                  max: 22.4,
                  avg: 18.0,
                  type: WeatherType.cloudy,
                ),
                WeatherCard(
                  city: 'Tokyo',
                  min: 17.1,
                  max: 27.2,
                  avg: 22.0,
                  type: WeatherType.sunnyCloudy,
                ),
                WeatherCard(
                  city: 'London',
                  min: 10.6,
                  max: 19.3,
                  avg: 15.2,
                  type: WeatherType.veryCloudy,
                ),
                WeatherCard(
                  city: 'Sydney',
                  min: 14.0,
                  max: 25.6,
                  avg: 19.2,
                  type: WeatherType.sunny,
                ),
                WeatherCard(
                  city: 'Paris',
                  min: 12.3,
                  max: 21.7,
                  avg: 16.8,
                  type: WeatherType.sunnyCloudy,
                ),
                WeatherCard(
                  city: 'Moscow',
                  min: 8.5,
                  max: 16.9,
                  avg: 12.0,
                  type: WeatherType.veryCloudy,
                ),
                WeatherCard(
                  city: 'Bangkok',
                  min: 25.0,
                  max: 33.0,
                  avg: 29.0,
                  type: WeatherType.sunny,
                ),
                WeatherCard(
                  city: 'Cape Town',
                  min: 10.9,
                  max: 19.5,
                  avg: 15.0,
                  type: WeatherType.cloudy,
                ),
                WeatherCard(
                  city: 'Rio de Janeiro',
                  min: 18.7,
                  max: 28.3,
                  avg: 23.4,
                  type: WeatherType.sunnyCloudy,
                ),
                WeatherCard(
                  city: 'Toronto',
                  min: 7.4,
                  max: 15.6,
                  avg: 11.5,
                  type: WeatherType.veryCloudy,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
