import 'package:data_visual_cubeten/controller/get_main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../data/guarantee.dart';

class PieChartWhole extends StatelessWidget {
  PieChartWhole({super.key});
  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  final MainController _mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    List<Guarantee> dataList = _mainController.dataList.value;
    return SfCircularChart(
      title: ChartTitle(text: "Pie"),
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        PieSeries<Guarantee, String>(
          dataSource: dataList,
          radius: "90%",
          xValueMapper: (Guarantee data, _) => data.statesUts,
          yValueMapper: (Guarantee data, _) =>
              data.amountOfCumulativeSinceInceptionIn2000Till28022023,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
          ),
        ),
        // PieSeries<Guarantee, String>(
        //   dataSource: dataList,
        //   radius: "70%",
        //   xValueMapper: (Guarantee data, _) => data.statesUts,
        //   yValueMapper: (Guarantee data, _) =>
        //       data.numberOfCumulativeSinceInceptionIn2000Till28022023,
        //   dataLabelSettings: DataLabelSettings(
        //     isVisible: true,
        //   ),
        // )
      ],
    );
  }
}
