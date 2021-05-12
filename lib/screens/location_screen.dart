import 'package:clima/model/Weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/AppConst.dart';

import '../utilities/AppConst.dart';

class LocationScreen extends StatefulWidget {

  final Weather weatherData;
  LocationScreen(this.weatherData);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  String _cityName;
  String _weatherIcon;
  String _weatherMessage;
  int _temperature;

  @override
  void initState() {
    super.initState();
    _cityName = widget.weatherData.getCityName;
    _weatherIcon = widget.weatherData.getWeatherIcon();
    _weatherMessage = widget.weatherData.getMessage();
    _temperature = widget.weatherData.getTemperature;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$_temperature°',
                      style: AppConst.tempTextStyle,
                    ),
                    Text(
                      '$_weatherIcon',
                      style: AppConst.conditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$_weatherMessage in $_cityName!",
                  textAlign: TextAlign.right,
                  style: AppConst.messageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
