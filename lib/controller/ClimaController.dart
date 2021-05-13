
import 'package:clima/model/Weather.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/LocationService.dart';
import 'package:clima/services/WebServices.dart';
import 'package:clima/utilities/AppSnackBar.dart';
import 'package:flutter/material.dart';

class ClimaController {

  LocationService _location = LocationService();
  Weather weatherData;

  Future<void> getCurrentLocationWeather(BuildContext context) async {
    try{
      await _getCurrentLocation();
      weatherData = await WebServices.getCurrentLocationWeather(_location.latitude.toString(), _location.longitude.toString());
      print('data details : ${weatherData.printInstance()}');
      pushToScreen(context, LocationScreen(weatherData));
    } catch(e) {
      print('exception : $e');
      ScaffoldMessenger.of(context).showSnackBar(AppSnackBar.getErrorSnackBar('a problem occurs : $e'));
    }
  }

  Future<void> _getCurrentLocation() async {
    await _location.getCurrentLocation();
    print("Current latitude : ${_location.latitude}\nCurrent longitude : ${_location.longitude}");
  }

  ///Uses Navigator.push.
  void pushToScreen(BuildContext context, Widget destinationScreen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destinationScreen),
    );
  }
}
