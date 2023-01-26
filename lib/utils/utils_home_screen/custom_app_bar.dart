import 'package:flutter/material.dart';

import '../../app/constants.dart';
import '../../model/weather_model.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final WeatherModel? provider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(
                  Icons.location_city_rounded,
                  color: kWhite,
                  size: 30,
                ),
                const SizedBox(width: 10),
                CustomText(
                  lable: provider?.country ?? 'Country Name',
                  fontSize: 18,
                  shadowTrue: true,
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 16,
            backgroundColor: kWhite,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.blueGrey,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
