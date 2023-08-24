import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../app/constants.dart';
import '../../../controller/home_controller.dart';
import '../../../utils/utils_home_screen/custom_text.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            // width: 120,
            height: 100,
            child: LottieBuilder.asset(Images.cloudy),
          ),
          GetBuilder<HomeController>(
            builder: (controller) {
              return CustomText(
                lable:
                    "wind ${controller.currentWeatherData.wind?.speed ?? '0'} m/s",
                colorText: kGrey,
                pTop: 10,
              );
            },
          ),
        ],
      ),
    );
  }
}
