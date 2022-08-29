import 'dart:convert';
import 'package:clima/screens/locationAccess.dart';
import 'package:http/http.dart' as http;

String apiKey = "398cd4ce0bb835f4d07d3dd61f9283a7";
UserLocation locationClass = UserLocation();

class NetworkingData {
  Future cityWeather(String cityName) async {
    var decodeData;
    String postsURL =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    http.Response response = await http.get(Uri.parse(postsURL));
    print("response ==> ${response.body}");
    if (response.statusCode == 200) {
      String data = response.body;
      decodeData = jsonDecode(data);
    } else {
      print(response);
    }
    return decodeData;
  }

  Future getWeather() async {
    await locationClass.getUserLocation();
    String postsURL =
        // "https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22";
        "https://api.openweathermap.org/data/2.5/weather?lat=${locationClass.latitude}&lon=${locationClass.longitude}&appid=$apiKey&units=metric";

    http.Response response = await http.get(Uri.parse(postsURL));
    String data = response.body;
    var decodeData = jsonDecode(data);
    return decodeData;
  }
}
