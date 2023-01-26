// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/constants.dart';
import 'package:weather_app/providers/weather_providers.dart';

import '../utils/utils_home_screen/custom_app_bar.dart';
import '../utils/utils_home_screen/custom_glassmorphic_container.dart';
import '../utils/utils_home_screen/custom_row_widget.dart';
import '../utils/utils_home_screen/custom_text.dart';
import '../utils/utils_home_screen/details_temp_widget.dart';
import '../utils/utils_home_screen/icon_and_title_weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WeatherProvider>(context).weatherData;
    var providerMethod = Provider.of<WeatherProvider>(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            (providerMethod.getImage())
                ? ImageAssest.backgroundMorningWeather
                : ImageAssest.backgroundNightWeather,
            fit: BoxFit.fitHeight,
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: Column(
              children: [
                const Spacer(flex: 3),
                CustomAppBar(provider: provider),
                const Spacer(flex: 2),
                CustomText(
                  lable: provider?.name ?? 'City Name',
                  fontSize: 40,
                  centerTextTrue: true,
                  shadowTrue: true,
                ),
                const Spacer(flex: 2),
                CustomGlassmorphicContainer(
                  height: MediaQuery.of(context).size.height / 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const CustomText(
                        lable: "Local Time City",
                        fontSize: 18,
                        letterSpacing: 1,
                      ),
                      CustomRowWidget(
                        lable: provider?.data.substring(0, 10) ?? '',
                        data:
                            "${provider?.data.substring(10) ?? ''} ${providerMethod.getTime()}",
                        fontSize: 18,
                        letterSpacing: 1,
                      ),
                    ],
                  ),
                ),
                CustomGlassmorphicContainer(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 25.0,
                      end: 25.0,
                      top: 20.0,
                      bottom: 45.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTitleWeather(
                          icon: provider?.icon != null
                              ? Image.network("http:${provider?.icon}")
                              : const Icon(Icons.image_not_supported_outlined),
                          stateWeather:
                              provider?.weatherStateName ?? 'Weather State',
                        ),
                        DetailsTempWidget(
                          label: 'Temp',
                          temp: "${provider?.temp.toString() ?? '0'} °C",
                          color: kWhite,
                        ),
                        DetailsTempWidget(
                          label: "Max Temp",
                          temp: "${provider?.maxTemp.toString() ?? '0'} °C",
                          color: kWhite,
                        ),
                        DetailsTempWidget(
                          label: "Main Temp",
                          temp: "${provider?.minTemp.toString() ?? '0'} °C",
                          color: kWhite,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
