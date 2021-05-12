
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/LocationService.dart';
import 'package:clima/services/WebServices.dart';
import 'package:flutter/material.dart';

class ClimaController {

  LocationService _location = LocationService();
  var data;

  Future<void> getWeatherDataByCurrentLocation(BuildContext context) async {
    try{
      await _getCurrentLocation();
      data = await WebServices.getWeatherDataByCurrentLocation(_location.latitude.toString(), _location.longitude.toString());
      print('data : $data');
      pushToScreen(context, LocationScreen());
    } catch(e) {
      print('exception : $e');
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
