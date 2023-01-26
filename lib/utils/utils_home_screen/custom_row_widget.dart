import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomRowWidget extends StatelessWidget {
  const CustomRowWidget({
    Key? key,
    required this.lable,
    required this.data,
    required this.fontSize,
    this.letterSpacing = 0,
  }) : super(key: key);

  final String lable;
  final String data;
  final double fontSize;
  final double letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: CustomText(
            lable: lable,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            centerTextTrue: true,
          ),
        ),
        Expanded(
          child: CustomText(
            lable: data,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            centerTextTrue: true,
          ),
        )
      ],
    );
  }
}
