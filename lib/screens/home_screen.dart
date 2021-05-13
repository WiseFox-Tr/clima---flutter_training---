import 'package:clima/controller/ClimaController.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/AppConst.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utilities/AppConst.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ClimaController _climaController = ClimaController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    //TODO : onChanged Callback !
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: AppConst.textFieldDecoration,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Weather for input location',
                  style: AppConst.buttonTextStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                child: Text(
                  'Weather for your location',
                  style: AppConst.buttonTextStyle,
                ),
                onPressed: () async {
                  setState(() => _isLoading = true);
                  await _climaController.getCurrentLocationWeather(context);
                  setState(() => _isLoading = false);
                },
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
                child: Visibility(
                  visible: _isLoading,
                  child: SpinKitDoubleBounce(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
