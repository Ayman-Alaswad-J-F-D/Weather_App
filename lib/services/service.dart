// ignore_for_file: avoid_print

import 'package:weather_app/model/error_model.dart';
import 'package:weather_app/model/five_days_data.dart';

import '../api/api_repo.dart';
import '../model/current_weather_data.dart';

class WeatherService {
  final String city;
  WeatherService({required this.city});

  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=ebfcbbf2712cf34cb9f6a91c52c03e2f';

  void getCurrentWeatherData({
    Function()? beforeSend,
    Function(CurrentWeatherData currentWeatherData)? onSaccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
    // print(url);

    ApiRepo(url: url, paylod: null).getData(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSaccess: (data) => {onSaccess!(CurrentWeatherData.fromJson(data))},
      onError: (error) => {
        if (onError != null)
          {
            print("CurrentWeathe Method Error"),
            onError(ErrorModel.fromJson(error)),
          }
      },
    );
  }

  void getFiveDaysThreeHoursForecastData({
    Function()? beforSend,
    Function(List<FiveDayData> fiveDayData)? onSaccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
    print(url);

    ApiRepo(url: url, paylod: null).getData(
      beforeSend: () => {if (beforSend != null) beforSend()},
      onSaccess: (data) => {
        onSaccess!(
          (data["list"] as List).map((t) => FiveDayData.fromJson(t)).toList(),
        ),
      },
      onError: (error) => {
        print("FiveDays Method Error"),
        print("*** Json Error $error"),
        onError!(ErrorModel.fromJson(error))
      },
    );
  }
}
