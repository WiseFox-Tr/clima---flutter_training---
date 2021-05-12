
import 'package:flutter/material.dart';

class AppSnackBar {

  static SnackBar getErrorSnackBar(String errorMessage) {
    return SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        errorMessage,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
