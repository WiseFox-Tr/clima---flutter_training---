import 'package:clima/utilities/HttpRequest.dart';
import 'package:clima/utilities/APIWeather.dart';

class WebServices {

  static Future<dynamic> getWeatherDataByCurrentLocation(String latitude, String longitude) async {
    Uri url = Uri.https(
      ApiWeather.authority,
      ApiWeather.unencodedPath,
      {
        'lat': latitude,
        'lon': longitude,
        'appid': ApiWeather.appid
      },
    );
    return HttpRequest.httpRequestGet(url);
  }
}
