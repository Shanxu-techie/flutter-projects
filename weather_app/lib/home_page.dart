import 'dart:convert';//jsonDecode

import 'package:flutter/material.dart';
import 'package:weather_app/frosted_glass_container.dart';
import 'package:weather_app/stat_card.dart';
import 'package:http/http.dart' as http;//http.get
import 'package:intl/intl.dart';//date time formatting
import 'package:geolocator/geolocator.dart';//getting current location

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Map<String, dynamic>> weatherFuture;

  Future<Map<String, dynamic>> getWeatherData() async {
    Map<String, dynamic> combinedData = {};

    Position currentPosition = await _determinePosition();

    String appId = "caccf5f629833bef9bff501808cdd107";
    double latitude = currentPosition.latitude;
    double longitude = currentPosition.longitude;

    String currentWeatherUrl =
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=$appId";

    http.Response currentWeatherResponse = await http.get(
      Uri.parse(currentWeatherUrl),
    );

    if (currentWeatherResponse.statusCode == 200) {
      var currentWeatherData = jsonDecode(currentWeatherResponse.body);
      combinedData['current'] = currentWeatherData;
    } else {
      throw Exception("Unable to fetch current weather data");
    }

    String forecastUrl =
        "https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=metric&appid=$appId";
    http.Response forecastResponse = await http.get(Uri.parse(forecastUrl));
    if (forecastResponse.statusCode == 200) {
      var forecastData = jsonDecode(forecastResponse.body);
      combinedData['forecast'] = forecastData;
    } else {
      throw Exception("Unable to fetch forecast data");
    }

    return combinedData;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    weatherFuture = getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: weatherFuture,
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (asyncSnapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(asyncSnapshot.error.toString()),
                      SizedBox(height: 20),
                      FilledButton(
                        onPressed: () {
                          setState(() {
                            weatherFuture = getWeatherData();
                          });
                        },
                        child: Text("Retry"),
                      ),
                    ],
                  ),
                ),
              );
            } else if (asyncSnapshot.hasData && asyncSnapshot.data != null) {
              var combinedData = asyncSnapshot.data!;
              var currentWeatherData = combinedData['current'];
              var city = currentWeatherData['name'];
              var country = currentWeatherData['sys']['country'];
              var outlook = currentWeatherData['weather'][0]['main'];
              var iconId = currentWeatherData['weather'][0]['icon'];
              var iconUrl =
                  "https://openweathermap.org/payload/api/media/file/$iconId.png";
              var currentTemperature = currentWeatherData['main']['temp'];
              var feelsLikeTemperature =
                  currentWeatherData['main']['feels_like'];
              var minTemp = currentWeatherData['main']['temp_min'];
              var maxTemp = currentWeatherData['main']['temp_max'];
              var humidity = currentWeatherData['main']['humidity'];
              var pressure = currentWeatherData['main']['pressure'];
              var wind = currentWeatherData['wind']['speed'];
              var visibility = currentWeatherData['visibility'];
              var timeStamp =
                  currentWeatherData['dt'] *
                  1000; //to convert s to milliseconds multiply with 1000

              var forecastData = combinedData['forecast'];
              List<dynamic> forecastList = forecastData['list'];

              return Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://img.freepik.com/premium-photo/vertical-tower-with-dreamy-scenic-cloudscape-background_665346-46186.jpg",
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.45),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.location_pin, size: 20),
                                Text(
                                  "$city, $country",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            // Text("Mar 24 - 10:53 PM"),
                            Text(
                              DateFormat("MMM dd - hh:mm a").format(
                                DateTime.fromMillisecondsSinceEpoch(timeStamp),
                              ),
                            ),
                          ],
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Image.network(iconUrl, width: 70),
                          ),
                          SizedBox(height: 12),
                          Text("$outlook", style: TextStyle(fontSize: 18)),
                          SizedBox(height: 12),
                          Text(
                            "${currentTemperature.toStringAsFixed(1)}°C",
                            style: TextStyle(
                              fontSize: 66,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            "Feels like ${feelsLikeTemperature.toStringAsFixed(1)}°C",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.keyboard_arrow_down),
                              Text("${minTemp.toStringAsFixed(1)}°C"),
                              SizedBox(width: 20),
                              Icon(Icons.keyboard_arrow_up),
                              Text("${maxTemp.toStringAsFixed(1)}°C"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        StatCard(
                          icon: Icons.water_drop,
                          value: '$humidity%',
                          label: 'Humidity',
                        ),
                        SizedBox(width: 8),
                        StatCard(
                          icon: Icons.air,
                          value: '$wind m/s',
                          label: 'Wind',
                        ),
                        SizedBox(width: 8),
                        StatCard(
                          icon: Icons.beach_access,
                          value: "$pressure hPa",
                          label: "Pressure",
                        ),
                        SizedBox(width: 8),
                        StatCard(
                          icon: Icons.visibility,
                          value: "$visibility m",
                          label: "Visibility",
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 164,
                      child: FrostedGlassContainer(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: forecastList.length,
                            itemBuilder: (context, index) {
                              var forecastObject = forecastList[index];
                              var time = forecastObject['dt'] * 1000;
                              var iconId = forecastObject['weather'][0]['icon'];
                              var iconUrl =
                                  "https://openweathermap.org/payload/api/media/file/$iconId.png";
                              var temperature = forecastObject['main']['temp'];
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        // "24 Mar\n12:00 PM",
                                        DateFormat('dd MMM\nhh:mm a').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                            time,
                                          ),
                                        ),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 14),
                                    Image.network(iconUrl, width: 36),
                                    SizedBox(height: 14),
                                    FittedBox(
                                      child: Text(
                                        "${temperature.toStringAsFixed(0)}°C",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(child: Text("No data available")),
              );
            }
          },
        ),
      ),
    );
  }
}
