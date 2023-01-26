import 'package:flutter/material.dart';

import '../../app/constants.dart';

class DetailsTempWidget extends StatelessWidget {
  const DetailsTempWidget({
    Key? key,
    required this.label,
    required this.temp,
    required this.color,
  }) : super(key: key);

  final String label;
  final String temp;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 20,
            color: color,
            shadows: const [
              Shadow(color: kWhite, blurRadius: 1),
              Shadow(color: kWhite, blurRadius: 2),
            ],
          ),
        ),
        const Spacer(),
        Text(
          temp,
          style: TextStyle(
            fontSize: 20,
            color: color,
            shadows: const [
              Shadow(color: kWhite, blurRadius: 1),
              Shadow(color: kWhite, blurRadius: 2),
            ],
          ),
        ),
      ],
    );
  }
}
