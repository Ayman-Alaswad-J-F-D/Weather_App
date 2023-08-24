import 'package:flutter/material.dart';
import 'package:weather_app/app/constants.dart';

// ignore: non_constant_identifier_names
SnackBar CustomSnackBar(text) => SnackBar(
      content: Text(text),
      padding: const EdgeInsets.all(20),
      duration: const Duration(seconds: 4),
      backgroundColor: kPrimaryColor,
    );
