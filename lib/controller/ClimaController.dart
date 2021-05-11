
import 'package:clima/services/LocationService.dart';
import 'package:clima/services/WebServices.dart';

class ClimaController {

  LocationService _location = LocationService();
  var data;

  void getWeatherData() async {
    try{
      await _getLocation();
      data = await WebServices.getDataByCurrentLocation(_location.latitude.toString(), _location.longitude.toString());
      print('data : $data');
    } catch(e) {
      print('exception : $e');
    }
  }

  Future<void> _getLocation() async {
    await _location.getCurrentLocation();
    print("Current latitude : ${_location.latitude}\nCurrent longitude : ${_location.longitude}");
  }
}
