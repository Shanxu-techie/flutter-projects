import 'package:flutter/material.dart';
import 'package:weather_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

// https://api.openweathermap.org/data/2.5/weather?lat=30.1864&lon=71.4886&units=metric&appid=446507f545ce10ab9e77364ef83ca081
// https://api.openweathermap.org/data/2.5/forecast/daily?lat=30.1864&lon=71.4886&units=metric&cnt=16&appid=446507f545ce10ab9e77364ef83ca081
// https://openweathermap.org/payload/api/media/file/10d@2x.png

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark, //to get dark mode
          seedColor: Colors.deepPurple,
        ),
      ),
      home: HomePage(),
    );
  }
}