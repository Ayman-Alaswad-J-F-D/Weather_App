import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/controller/home_controller.dart';
import 'package:weather_app/model/current_weather_data.dart';
import 'package:weather_app/utils/list_view_animation.dart';

import '../../app/constants.dart';
import '../../utils/utils_home_screen/custom_row_widget.dart';
import '../../utils/utils_home_screen/custom_text.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SizedBox(
          child: SizedBox.fromSize(
            size: Size.fromHeight(MediaQuery.of(context).size.height * 0.32),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: controller.dataList?.isNotEmpty ?? true
                  ? controller.dataList!.length
                  : 5,
              itemBuilder: (context, index) {
                //*
                late CurrentWeatherData data = controller.dataList![index];
                //*
                return controller.dataList?.isNotEmpty ?? true
                    ? ListViewAnimation(
                        index: index,
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  child: LottieBuilder.asset(Images.cloudyMain),
                                  backgroundColor: Colors.grey.shade200,
                                  radius: 26,
                                ),
                                CustomText(
                                  lable: controller.dataList![index].name ??
                                      'Country',
                                  colorText: kPrimaryColor,
                                  fontSize: 13,
                                  pBottom: 20,
                                  pTop: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomRowWidget(
                                    colorText1: Colors.orangeAccent,
                                    colorText2: Colors.red,
                                    minTemp:
                                        "${data.main?.tempMin.toString() ?? 0}\u2103",
                                    maxTemp:
                                        "${data.main?.tempMin.toString() ?? 0}\u2103",
                                    fontSize: 16,
                                  ),
                                ),
                                const Spacer(flex: 2),
                                CustomText(
                                  lable: data.weather![0].des!,
                                  colorText: kGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Shimmer.fromColors(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: 140,
                          decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        baseColor: Colors.grey.shade200,
                        highlightColor: Colors.grey.shade100,
                      );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 15),
            ),
          ),
        );
      },
    );
  }
}
