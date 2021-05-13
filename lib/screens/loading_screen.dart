
import 'package:clima/controller/ClimaController.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  ClimaController _climaController = ClimaController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              child: Text(
                'Get weather'
              ),
              onPressed: () async {
                setState(() => _isLoading = true);
                await _climaController.getCurrentLocationWeather(context);
                setState(() => _isLoading = false);
              },
            ),
            Visibility(
              visible: _isLoading,
              child: SpinKitDoubleBounce(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
