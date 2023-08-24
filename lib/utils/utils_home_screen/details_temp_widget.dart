import 'package:flutter/material.dart';

// ! Not User
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
              Shadow(color: Colors.black38, blurRadius: 1),
              // Shadow(color: Colors.black, blurRadius: 2),
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
              Shadow(color: Colors.black38, blurRadius: 1),
              // Shadow(color: Colors.black, blurRadius: 2),
            ],
          ),
        ),
      ],
    );
  }
}
