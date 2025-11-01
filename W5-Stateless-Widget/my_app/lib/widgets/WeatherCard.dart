import 'package:flutter/material.dart';

// AI assisted in generating colors
enum WeatherType {
  sunny(
    "assets/images/sunny.png",
    Colors.amber,
    LinearGradient(
      colors: [
        Color(0xFFFFE599), // Darker yellow
        Color(0xFFFFC107), // Deeper golden
        Color(0xFFFF8500), // Rich amber
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  cloudy(
    "assets/images/cloudy.png",
    Color(0xFF90A4AE),
    LinearGradient(
      colors: [
        Color(0xFFB8C6D1), // Slightly darker blue-grey
        Color(0xFF78909C), // Muted blue-grey
        Color(0xFF455A64), // Much darker
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  sunnyCloudy(
    "assets/images/sunnyCloudy.png",
    Color(0xFFA7D3F6),
    LinearGradient(
      colors: [
        Color(0xFFF3E88E), // Darkened sunny highlight
        Color(0xFFB8D8F6), // Deeper sky blue
        Color(0xFF4682B4), // SteelBlue, much darker, stays harmonious
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  veryCloudy(
    "assets/images/veryCloudy.png",
    Color(0xFFB0BEC5),
    LinearGradient(
      colors: [
        Color(0xFFD6D8DB), // A bit darker than previous light
        Color(0xFF90A4AE), // Muted blue-grey
        Color(0xFF37474F), // Even darker blue-grey
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  final String icon;
  final Color color;
  final Gradient gradient;
  const WeatherType(this.icon, this.color, this.gradient);
}

class WeatherCard extends StatelessWidget {
  final String city;
  final double min;
  final double max;
  final double avg;
  final WeatherType type;

  const WeatherCard({
    super.key,
    required this.city,
    required this.min,
    required this.max,
    required this.avg,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      shadowColor: Colors.black,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: type.color,
          gradient: type.gradient,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            WeatherStatistics(
              type: type,
              city: city,
              min: min,
              max: max,
              avg: avg,
            ),
            AverageTemperature(type: type, avg: avg),
          ],
        ),
      ),
    );
  }
}

class AverageTemperature extends StatelessWidget {
  final WeatherType type;
  final double avg;
  const AverageTemperature({super.key, required this.type, required this.avg});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -40,
      right: -30,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: type.gradient.colors.first.withAlpha(128),
              borderRadius: BorderRadius.circular(75),
            ),
            width: 150,
            height: 150,
          ),
          Container(
            padding: EdgeInsets.only(top: 50, left: 30),
            alignment: Alignment.center,
            child: Text(
              avg.toString() + " °C",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherStatistics extends StatelessWidget {
  final WeatherType type;
  final String city;
  final double min;
  final double max;
  final double avg;
  const WeatherStatistics({
    super.key,
    required this.type,
    required this.city,
    required this.min,
    required this.max,
    required this.avg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 20,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Image.asset(type.icon, width: 30),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Min: " + min.toString() + " °C",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Max: " + max.toString() + " °C",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
