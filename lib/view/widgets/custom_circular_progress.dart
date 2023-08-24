import 'package:flutter/material.dart';

import '../../app/constants.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({
    Key? key,
    this.elevation = 1.5,
  }) : super(key: key);

  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: const CircleBorder(),
        color: kWhite,
        elevation: elevation,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kWhite,
            child: CircularProgressIndicator(
              color: kPrimaryColor,
              // backgroundColor: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
