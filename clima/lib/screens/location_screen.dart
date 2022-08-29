import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherImages = WeatherModel();
  NetworkingData networkingClass = NetworkingData();

  late int temperature;
  late int condition;
  late String cityName;
  late String weatherIcon;
  late String weatherMessage;
  @override
  void initState() {
    super.initState();
    updatedUI(widget.locationWeather);
  }

  void updatedUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherMessage = "Wrong";
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      print("temperature ====>>>> $temperature $cityName");
      weatherIcon = weatherImages.getWeatherIcon(condition);
      weatherMessage = weatherImages.getMessage(temperature);
    });
  }

  void cityNames() async {
    var enteredCity =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CityScreen();
    }));
    print(enteredCity);
    if (enteredCity != null) {
      var updatedCityWeather = await networkingClass.cityWeather(enteredCity);
      print("updatedCityWeather ==> $updatedCityWeather");
      updatedUI(updatedCityWeather);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      var updatedWeather = await networkingClass.getWeather();
                      updatedUI(updatedWeather);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      cityNames();
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "$temperature°",
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Text(
                  "$weatherMessage in $cityName",
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
