import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String city;
  final double min;
  final double max;
  final IconData icon;
  final double avg;
  final Color? color;
  final Gradient? gradient;
  final Color? iconColor;

  const WeatherCard({
    super.key,
    required this.city,
    required this.min,
    required this.max,
    required this.avg,
    required this.icon,
    this.color,
    this.gradient,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? const Color.fromRGBO(255, 255, 255, 1),
        gradient: gradient ?? gradient,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 20,
            children: [
              Center(
                child: Container(
                  child: Icon(icon, size: 30, color: iconColor ?? Colors.black),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(10),
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
                    min.toString() + "°C",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    max.toString() + "°C",
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
          Text(
            avg.toString() + "°C",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
