import 'package:clima/screens/locationAccess.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  NetworkingData networkingClass = NetworkingData();

  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    var whetherData = await networkingClass.getWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: whetherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const SpinKitDoubleBounce(
            color: Colors.white,
            size: 100,
          ),
          ElevatedButton(
            onPressed: () {
              locationClass.getUserLocation();
            },
            child: const Text('Get Location'),
          ),
        ],
      )),
    );
  }
}
