// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/mapper.dart';

class WeatherService {
  late WeatherModel weatherModel;

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      String baseUrl = 'https://api.weatherapi.com/v1';
      String apikKey = 'df3a7bb8f69a4b2cb9594311221312';

      Uri url = Uri.parse('$baseUrl/forecast.json?key=$apikKey&q=$cityName');
      http.Response response = await http.get(url);
      print(response.body);

      var data = jsonDecode(response.body);
      weatherModel = WeatherModel.fromJson(data);

      print(weatherModel.temp);
      print(weatherModel.minTemp);
      print(weatherModel.maxTemp);
      print(weatherModel.icon);

      return weatherModel;
    } catch (e) {
      return weatherModel.toDomain();
    }
  }
}
