import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/wether_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '42ca314a5e044285a1d95119232609';
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      http.Response resopnse = await http.get(url);
      Map<String, dynamic> data = jsonDecode(resopnse.body);
      print(data);
      weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
