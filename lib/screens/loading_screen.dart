import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';
import 'package:http/http.dart' as http;

const APIkey = '791f0cc1c9082b2de17d681be885e6cf';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? Latitude;
  double? Longitude;
  //As soon as the app starts initState is called and wwe have passed the
  //getLocation() method to get the location as we start the app.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    //we got current location here
    await location.getCurrentLocation();

    Latitude = location.latitude;
    Longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=$Latitude&lon=$Longitude&appid=$APIkey');

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

// (http.get(Uri.parse(
// 'http://api.openweathermap.org/data/2.5/weather?lat=$Latitude&lon=$Longitude&appid=$APIkey')));
