import 'package:flutter/material.dart';
import 'card_weather.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0.0, 1.0),
      child: SizedBox(
        height: 30,
        width: 30,
        child: OverflowBox(
          minWidth: 0.0,
          minHeight: 0.0,
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height / 3.11,
          child: const CardWeather(),
        ),
      ),
    );
  }
}
