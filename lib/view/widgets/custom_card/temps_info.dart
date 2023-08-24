import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/utils/utils_home_screen/custom_row_widget.dart';

import '../../../app/constants.dart';
import '../../../controller/home_controller.dart';
import '../../../utils/utils_home_screen/custom_text.dart';

class TempsInfo extends StatelessWidget {
  const TempsInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Expanded(
          flex: 2,
          child: Column(
            children: [
              CustomText(
                lable:
                    controller.currentWeatherData.weather?[0].des?.capitalize ??
                        'Weather State',
                colorText: kPrimaryColor,
                centerTextTrue: true,
                fontSize: 18,
                pTop: 5,
              ),
              CustomText(
                lable:
                    "${controller.currentWeatherData.main?.temp ?? 0} \u2103",
                colorText: Colors.grey,
                centerTextTrue: true,
                fontSize: 30,
                pTop: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CustomRowWidget(
                  minTemp:
                      "min ${controller.currentWeatherData.main?.tempMin ?? 0}\u2103",
                  maxTemp:
                      "max ${controller.currentWeatherData.main?.tempMax ?? 0}\u2103",
                  colorText1: Colors.orangeAccent,
                  colorText2: Colors.red,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
