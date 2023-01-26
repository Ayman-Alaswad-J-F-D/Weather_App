import 'package:flutter/material.dart';

import '../../app/constants.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.lable,
    required this.fontSize,
    this.letterSpacing = 0,
    this.fontWeight = FontWeight.normal,
    this.shadowTrue = false,
    this.centerTextTrue = false,
  }) : super(key: key);

  final String lable;
  final double fontSize;
  final double letterSpacing;
  final FontWeight fontWeight;
  final bool shadowTrue;
  final bool centerTextTrue;

  @override
  Widget build(BuildContext context) {
    return Text(
      lable,
      textAlign: centerTextTrue ? TextAlign.center : null,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: kWhite,
        letterSpacing: letterSpacing,
        shadows: shadowTrue
            ? const [
                Shadow(color: kWhite, blurRadius: 8),
                Shadow(color: Colors.black, blurRadius: 5),
              ]
            : null,
      ),
    );
  }
}
