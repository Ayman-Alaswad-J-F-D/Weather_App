import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({Key? key, required this.pTob, required this.text})
      : super(key: key);

  final double pTob;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * pTob,
        bottom: 5,
        left: 10,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, color: Colors.orange),
      ),
    );
  }
}
