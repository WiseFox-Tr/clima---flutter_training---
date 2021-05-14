import 'package:flutter/material.dart';

class AppConst {
  //backgrounds
  static const String homeBackground = 'images/city_background.jpg';
  static const String weatherBackground = 'images/location_background.jpg';

  //styles
  static const tempTextStyle = TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: 80.0,
  );

  static const messageTextStyle = TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: 50.0,
  );

  static const cityTextStyle = TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: 60.0,
    color: Colors.lightBlueAccent,
  );

  static const buttonTextStyle = TextStyle(
    fontSize: 25.0,
    fontFamily: 'Spartan MB',
  );

  static const conditionTextStyle = TextStyle(
    fontSize: 100.0,
  );

  static const textFieldDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(Icons.location_city, color: Colors.white,),
    hintText: 'enter city name',
    hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide.none,
    ),
  );
}
