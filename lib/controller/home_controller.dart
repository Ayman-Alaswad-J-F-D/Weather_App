// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/model/current_weather_data.dart';
import 'package:weather_app/model/error_model.dart';
import 'package:weather_app/model/five_days_data.dart';
import 'package:weather_app/services/service.dart';
import 'package:weather_app/utils/utils_search_screen/custom_snack_bar.dart';

class HomeController extends GetxController {
  String? city;

  HomeController({this.city});

  final InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker();

  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<FiveDayData>? fiveDayData = [];
  List<CurrentWeatherData>? dataList = [];
  ErrorModel? errorModel = ErrorModel();

  @override
  void onInit() {
    initStateController();
    getTopFiveCites();
    super.onInit();
  }

  checkerInternet({
    required BuildContext context,
    required Function() function,
  }) async {
    if (await internetConnectionChecker.hasConnection) return function();
    ScaffoldMessenger.of(context)
        .showSnackBar(CustomSnackBar("Check your connection in internet ..."));
  }

  void updateWeather(context) => getCurrentWeatherData(context: context)
      .then((value) => getTopFiveCites());

  void initStateController({BuildContext? context}) {
    if (context != null) {
      checkerInternet(
        context: context,
        function: () async {
          await getCurrentWeatherData();
          getTopFiveCites();
        },
      );
    } else {
      getCurrentWeatherData();
      getTopFiveCites();
    }
  }

  Future<void> getCurrentWeatherData({BuildContext? context}) async {
    WeatherService(city: "$city").getCurrentWeatherData(
      onSaccess: (data) {
        currentWeatherData = data;
        print('Update Done');
        update();
      },
      onError: (error) {
        errorModel = error;
        print(errorModel!.message);
        update();
        ScaffoldMessenger.of(context!).showSnackBar(
          CustomSnackBar("${errorModel!.message?.toUpperCase()}"),
        );
      },
    );
  }

  void getFiveDayData() {
    WeatherService(city: "$city").getFiveDaysThreeHoursForecastData(
      onSaccess: (data) {
        fiveDayData = data;
        print('Update Done');
        update();
      },
      onError: (error) {
        errorModel = error;
        print(errorModel!.message);
        update();
      },
    );
  }

  void getTopFiveCites() {
    List<String> cites = [
      'Latakia',
      'Tartus',
      'Aleppo',
      'Palmyra',
      'Deir ez-Zor',
      'Daraa',
      'Hama',
      'Homs',
    ];

    // ignore: avoid_function_literals_in_foreach_calls
    cites.forEach((c) {
      WeatherService(city: c).getCurrentWeatherData(
        onSaccess: (data) {
          dataList?.add(data);
          update();
        },
        onError: (error) {
          print("TopFiveCity MethodController $error");
          update();
        },
      );
    });
  }

  bool getImage() {
    final dataTime = DateTime.now();

    if (dataTime.hour >= 7 && dataTime.hour <= 16) return true;
    return false;
  }
}
