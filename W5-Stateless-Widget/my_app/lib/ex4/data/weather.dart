// This file is used to store the weather data for the weather app.
// WeatherData class was implemented to enforce type safety and to be able to use the dot operator

// alternatively this could just be a var weatherData = [
//   {city: 'New York', min: 13.2, max: 22.4, avg: 18.0, type: WeatherType.cloudy},
//   {city: 'Tokyo', min: 17.1, max: 27.2, avg: 22.0, type: WeatherType.sunnyCloudy},
// ...
// ];

import '../../widgets/WeatherCard.dart';

class WeatherData {
  String city;
  double min;
  double max;
  double avg;
  WeatherType type;

  WeatherData({
    required this.city,
    required this.min,
    required this.max,
    required this.avg,
    required this.type,
  });
}

// AI assisted in generating locations and temperatures for the weather data
final List<WeatherData> weatherData = [
  WeatherData(
    city: 'New York',
    min: 13.2,
    max: 22.4,
    avg: 18.0,
    type: WeatherType.cloudy,
  ),
  WeatherData(
    city: 'Tokyo',
    min: 17.1,
    max: 27.2,
    avg: 22.0,
    type: WeatherType.sunnyCloudy,
  ),
  WeatherData(
    city: 'London',
    min: 10.6,
    max: 19.3,
    avg: 15.2,
    type: WeatherType.veryCloudy,
  ),
  WeatherData(
    city: 'Sydney',
    min: 14.0,
    max: 25.6,
    avg: 19.2,
    type: WeatherType.sunny,
  ),
  WeatherData(
    city: 'Paris',
    min: 12.3,
    max: 21.7,
    avg: 16.8,
    type: WeatherType.sunnyCloudy,
  ),
  WeatherData(
    city: 'Moscow',
    min: 8.5,
    max: 16.9,
    avg: 12.0,
    type: WeatherType.veryCloudy,
  ),
  WeatherData(
    city: 'Bangkok',
    min: 25.0,
    max: 33.0,
    avg: 29.0,
    type: WeatherType.sunny,
  ),
  WeatherData(
    city: 'Cape Town',
    min: 10.9,
    max: 19.5,
    avg: 15.0,
    type: WeatherType.cloudy,
  ),
  WeatherData(
    city: 'Rio de Janeiro',
    min: 18.7,
    max: 28.3,
    avg: 23.4,
    type: WeatherType.sunnyCloudy,
  ),
  WeatherData(
    city: 'Toronto',
    min: 7.4,
    max: 15.6,
    avg: 11.5,
    type: WeatherType.veryCloudy,
  ),
];
