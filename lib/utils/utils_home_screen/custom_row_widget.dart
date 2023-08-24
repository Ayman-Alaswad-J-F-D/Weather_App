import 'package:flutter/material.dart';

import '../../app/constants.dart';
import 'custom_text.dart';

class CustomRowWidget extends StatelessWidget {
  const CustomRowWidget({
    Key? key,
    this.minTemp = "",
    this.maxTemp = "",
    required this.fontSize,
    this.letterSpacing = 0,
    this.colorText1 = kWhite,
    this.colorText2 = kWhite,
  }) : super(key: key);

  final String minTemp;
  final String maxTemp;
  final double fontSize;
  final double letterSpacing;
  final Color colorText1;
  final Color colorText2;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          lable: minTemp,
          fontSize: fontSize,
          letterSpacing: letterSpacing,
          colorText: colorText1,
        ),
        const SizedBox(width: 5),
        const Text('/', style: TextStyle(color: Colors.grey)),
        const SizedBox(width: 5),
        CustomText(
          lable: maxTemp,
          fontSize: fontSize,
          letterSpacing: letterSpacing,
          colorText: colorText2,
        )
      ],
    );
  }
}
