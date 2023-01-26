import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
SnackBar CustomSnackBar(text) => SnackBar(
      padding: const EdgeInsets.all(20),
      content: Text(
        text,
      ),
      duration: const Duration(seconds: 4),
    );
