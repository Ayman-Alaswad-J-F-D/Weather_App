import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../app/constants.dart';
import '../../../controller/home_controller.dart';
import '../../../utils/utils_home_screen/custom_text.dart';

class CityAndDate extends StatelessWidget {
  const CityAndDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<HomeController>(
          builder: (controller) {
            return CustomText(
              lable: controller.currentWeatherData.name ?? 'City',
              fontWeight: FontWeight.bold,
              colorText: kPrimaryColor,
              centerTextTrue: true,
              shadowTrue: true,
              letterSpacing: 1,
              fontSize: 20,
              pBottom: 5,
            );
          },
        ),
        CustomText(
          lable: DateFormat().add_MMMMEEEEd().format(DateTime.now()).toString(),
          centerTextTrue: true,
          colorText: kGrey,
          fontSize: 13,
        ),
      ],
    );
  }
}
