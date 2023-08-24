import 'package:flutter/material.dart';

import '../../app/constants.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.lable,
    this.fontSize = 14,
    this.letterSpacing = 0,
    this.fontWeight = FontWeight.normal,
    this.shadowTrue = false,
    this.centerTextTrue = false,
    this.colorText,
    this.pTop = 0,
    this.pBottom = 0,
    this.pLeft = 0,
    this.pRight = 0,
  }) : super(key: key);

  final String lable;
  final double fontSize;
  final double letterSpacing;
  final double pTop;
  final double pBottom;
  final double pLeft;
  final double pRight;
  final FontWeight fontWeight;
  final bool shadowTrue;
  final bool centerTextTrue;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: pTop,
        bottom: pBottom,
        left: pLeft,
        right: pRight,
      ),
      child: Text(
        lable,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: centerTextTrue ? TextAlign.center : null,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: colorText,
          letterSpacing: letterSpacing,
          shadows: shadowTrue
              ? const [
                  Shadow(color: kWhite, blurRadius: 4),
                  Shadow(color: Colors.black26, blurRadius: 3),
                ]
              : null,
        ),
      ),
    );
  }
}
