import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/home_controller.dart';
import 'package:weather_app/view/widgets/chart_widget.dart';

import '../../app/constants.dart';
import '../widgets/custom_card/custom_card.dart';
import '../../utils/custom_label.dart';
import '../widgets/custom_list_view.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/chart_widget.dart';

class MainScreen extends GetView<HomeController> {
  const MainScreen({Key? key}) : super(key: key);

  static const String routeName = '/MainScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<HomeController>(
        builder: (controller) => RefreshIndicator(
          onRefresh: () async =>
              controller.initStateController(context: context),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchAndCard(),
                const CustomLabel(pTob: 0.16, text: 'Other Citys'),
                const CustomListView(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomLabel(pTob: 0.02, text: 'Forcast Next 5 Days'),
                      Icon(Icons.next_plan_outlined, color: Colors.grey),
                    ],
                  ),
                ),
                const ChartWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchAndCard extends GetView<HomeController> {
  const SearchAndCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            controller.getImage()
                ? Images.backgroundMorningWeather
                : Images.backgroundNightWeather,
          ),
          colorFilter: const ColorFilter.mode(Colors.black26, BlendMode.darken),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Stack(
        children: [
          CustomTextField(),
          const CustomCard(),
        ],
      ),
    );
  }
}
