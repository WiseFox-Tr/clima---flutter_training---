
import 'package:clima/controller/ClimaController.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  ClimaController _climaController = ClimaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text(
            'Get weather'
          ),
          onPressed: () => _climaController.getWeatherDataByCurrentLocation(context),
        ),
      ),
    );
  }
}
