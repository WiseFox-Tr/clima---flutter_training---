import 'dart:convert';

import 'package:clima/utilities/APIWeather.dart';
import 'package:http/http.dart' as http;

class HttpRequest {

  static dynamic httpRequestGet(Uri url) async {
    http.Response response = await http.get(url);

    if(response.statusCode == 200) {
      var data = response.body;
      print('status code : ${response.statusCode}');
      print('data retrieved : $data');
      return jsonDecode(data);
    }
    else {
      print('response code : ${response.statusCode}');
      throw Exception('failed to retrieve data : response code : ${response.statusCode}') ;
    }
  }
}
