import 'package:clima/model/Weather.dart';
import 'package:clima/utilities/HttpRequest.dart';
import 'package:clima/utilities/APIWeather.dart';

class WebServices {

  static Future<Weather> getCurrentLocationWeather(String latitude, String longitude) async {
    dynamic data;
    Uri url = Uri.https(
      ApiWeatherConst.authority,
      ApiWeatherConst.unencodedPath,
      {
        'lat': latitude,
        'lon': longitude,
        'units': 'metric',
        'appid': ApiWeatherConst.appid
      },
    );
    data = await HttpRequest.httpRequestGet(url);
    return Weather(data['weather'][0]['id'], data['name'], data['main']['temp'].toInt());
  }

  static Future<Weather> getInputLocationWeather(String cityName) async {
    dynamic data;
    Uri url = Uri.https(
        ApiWeatherConst.authority,
        ApiWeatherConst.unencodedPath,
      {
        'q' : cityName,
        'units' : 'metric',
        'appid' : ApiWeatherConst.appid
      }
    );
    data = await HttpRequest.httpRequestGet(url);
    return Weather(data['weather'][0]['id'], data['name'], data['main']['temp'].toInt());
  }
}
