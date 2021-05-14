
import 'package:clima/model/Weather.dart';
import 'package:clima/screens/weather_screen.dart';
import 'package:clima/services/LocationService.dart';
import 'package:clima/services/WebServices.dart';
import 'package:clima/utilities/AppSnackBar.dart';
import 'package:flutter/material.dart';

class ClimaController {

  LocationService _location = LocationService();
  Weather _weatherData;
  String _citySearched;

  get getCitySearched => _citySearched;
  set setCitySearched(String newValue) => _citySearched = newValue;

  Future<void> getCurrentLocationWeather(BuildContext context) async {
    try{
      await _getCurrentLocation();
      _weatherData = await WebServices.getCurrentLocationWeather(_location.latitude.toString(), _location.longitude.toString());
      print('data details : ${_weatherData.printInstance()}');
      _pushToScreen(context);
    } catch(e) {
      print('exception : $e');
      ScaffoldMessenger.of(context).showSnackBar(AppSnackBar.getErrorSnackBar('Oups ! A problem occurs...'));
    }
  }

  Future<void> getInputLocationWeather(BuildContext context) async {
    try {
      _weatherData = await WebServices.getInputLocationWeather(_citySearched);
      print('data details : ${_weatherData.printInstance()}');
      _pushToScreen(context);
    } catch (e) {
      print('exception : $e');
      ScaffoldMessenger.of(context).showSnackBar(AppSnackBar.getErrorSnackBar('Oups ! A problem occurs...\nMaybe try an other name'));
    }
  }

  Future<void> _getCurrentLocation() async {
    await _location.getCurrentLocation();
    print("Current latitude : ${_location.latitude}\nCurrent longitude : ${_location.longitude}");
  }

  void _pushToScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WeatherScreen(_weatherData)),
    );
  }
}
