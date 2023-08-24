import 'package:flutter/material.dart';

import '../../app/constants.dart';
import 'custom_text.dart';

// !  Not Use
class IconAndTitleWeather extends StatelessWidget {
  const IconAndTitleWeather({
    Key? key,
    required this.stateWeather,
    required this.icon,
    this.color = kWhite,
    this.colorText = kWhite,
  }) : super(key: key);

  final String stateWeather;
  final Widget icon;
  final Color color;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            colorText: colorText,
            lable: stateWeather,
            letterSpacing: 1,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          CircleAvatar(
            backgroundColor: color,
            radius: 25,
            child: icon,
          ),
        ],
      ),
    );
  }
}
