import 'package:flutter/material.dart';

import '../../../utils/utils_search_screen/custom_divider.dart';
import 'city_and_date.dart';
import 'temps_info.dart';
import 'weather_icon.dart';

class CardWeather extends StatefulWidget {
  const CardWeather({Key? key}) : super(key: key);

  @override
  State<CardWeather> createState() => _CardWeatherState();
}

class _CardWeatherState extends State<CardWeather> {
  CrossFadeState showing = CrossFadeState.showFirst;

  void animatedContainer() {
    Future.delayed(
      const Duration(milliseconds: 2100),
      () => setState(() => showing = CrossFadeState.showSecond),
    );
  }

  @override
  Widget build(BuildContext context) {
    animatedContainer();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: AnimatedCrossFade(
        crossFadeState: showing,
        duration: const Duration(milliseconds: 800),
        // First Child when loding data
        firstChild: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width / 1.5,
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        // Second Child when loded data
        secondChild: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const CityAndDate(),
                const CustomDivider(),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Row(
                    children: const [
                      TempsInfo(),
                      SizedBox(width: 20),
                      WeatherIcon(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
