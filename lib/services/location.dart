import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position positionLow = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = positionLow.latitude;
      longitude = positionLow.longitude;
    } catch (e) {
      print(e);
    }
  }
}
