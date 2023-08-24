import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../controller/home_controller.dart';
import '../../model/five_days_data.dart';

class ChartWidget extends GetView<HomeController> {
  const ChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 240,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries<FiveDayData, String>>[
                SplineSeries<FiveDayData, String>(
                  dataSource: controller.fiveDayData!,
                  xValueMapper: (FiveDayData f, _) => f.dateTime,
                  yValueMapper: (FiveDayData f, _) => f.temp,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
