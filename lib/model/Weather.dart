import 'package:clima/utilities/AppText.dart';

class Weather {
  int _idWeather;
  String _cityName;
  int _temperature;

  Weather(this._idWeather, this._cityName, this._temperature);

  get getCityName => _cityName;
  get getTemperature => _temperature;

  String getWeatherIcon() {
    if (_idWeather < 300) {
      return '🌩';
    } else if (_idWeather < 400) {
      return '🌧';
    } else if (_idWeather < 600) {
      return '☔️';
    } else if (_idWeather < 700) {
      return '☃️';
    } else if (_idWeather < 800) {
      return '🌫';
    } else if (_idWeather == 800) {
      return '☀️';
    } else if (_idWeather <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage() {
    if (_temperature > 25) {
      return AppTexts.hotWeather;
    } else if (_temperature > 20) {
      return AppTexts.niceWeather;
    } else if (_temperature < 10) {
      return AppTexts.coldWeather;
    } else {
      return AppTexts.mediumWeather;
    }
  }

  String printInstance() {
    return 'id weather : ${this._idWeather}, city name : ${this._cityName}, temperature : ${this._temperature}\n'
    'message : ${this.getMessage()}, weather icon : ${this.getWeatherIcon()}';
  }
}
