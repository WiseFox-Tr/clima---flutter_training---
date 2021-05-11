import 'package:geolocator/geolocator.dart';

class LocationService {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    Position positionLow = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latitude = positionLow.latitude;
    longitude = positionLow.longitude;
  }
}
