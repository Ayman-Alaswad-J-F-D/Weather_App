import 'package:flutter/material.dart';

import '../../app/constants.dart';
import 'custom_text.dart';

class IconAndTitleWeather extends StatelessWidget {
  const IconAndTitleWeather({
    Key? key,
    required this.stateWeather,
    required this.icon,
  }) : super(key: key);

  final String stateWeather;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CircleAvatar(
            child: icon,
            backgroundColor: kWhite,
            radius: 40,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 3,
          child: CustomText(
            lable: stateWeather,
            fontSize: 18,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
