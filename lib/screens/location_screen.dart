import 'package:clima/controller/ClimaController.dart';
import 'package:clima/model/Weather.dart';
import 'package:flutter/cupertino.dart';
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

  ClimaController _climaController = ClimaController();
  String _weatherIcon;
  String _weatherCity;
  String _weatherMessage;
  int _temperature;

  @override
  void initState() {
    super.initState();
    _weatherIcon = widget.weatherData.getWeatherIcon();
    _weatherCity = widget.weatherData.getCityName;
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      await _climaController.getCurrentLocationWeather(context);
                    },
                    child: Icon(
                      Icons.near_me,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  _weatherCity,
                  style: AppConst.cityTextStyle,
                  textAlign: TextAlign.center,
                ),
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
                  _weatherMessage,
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
