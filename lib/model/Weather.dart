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
      return 'It\'s 🍦 time';
    } else if (_temperature > 20) {
      return 'Time for shorts and 👕';
    } else if (_temperature < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  String printInstance() {
    return 'id weather : ${this._idWeather}, city name : ${this._cityName}, temperature : ${this._temperature}\n'
    'message : ${this.getMessage()}, weather icon : ${this.getWeatherIcon()}';
  }
}
