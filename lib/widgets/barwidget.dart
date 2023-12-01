import 'package:data_visual_cubeten/controller/get_main_controller.dart';
import 'package:data_visual_cubeten/widgets/modalgraph.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../data/guarantee.dart';

class BarChartWidget extends StatelessWidget {
  BarChartWidget({
    super.key,
  });

  final MainController _mainController = Get.put(MainController());
  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  @override
  Widget build(BuildContext context) {
    List<Guarantee> dataList = _mainController.dataList.value;
    return Obx(
      () => SfCartesianChart(
        onAxisLabelTapped: (AxisLabelTapArgs ax) {
          int index = ax.value.toInt();

          showModalBottomSheet(
            isScrollControlled: true,
            isDismissible: false,
            context: context,
            builder: (context) {
              return ModalGraph(
                index: index,
                guaranteeList: dataList,
              );
            },
          );
        },
        tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries>[
          // ColumnSeries<Guarantee, String>(
          //     name: "Amount of cumulative",
          //     dataLabelSettings: const DataLabelSettings(
          //         isVisible: true, textStyle: TextStyle(fontSize: 7)),
          //     dataSource: widget.chartData,
          //     xValueMapper: (Guarantee gt, _) => gt.statesUts,
          //     yValueMapper: (Guarantee gt, _) => gt
          //         .amountOfCumulativeSinceInceptionIn2000Till28022023),
          BarSeries<Guarantee, String>(
            name: "Number of cumulative",
            spacing: 0.2,
            dataLabelSettings: DataLabelSettings(
              isVisible: _mainController.seeNum.value,
              textStyle: const TextStyle(fontSize: 7),
            ),
            dataSource: dataList,
            xValueMapper: (Guarantee gt, _) => gt.statesUts,
            yValueMapper: (Guarantee gt, _) =>
                gt.numberOfCumulativeSinceInceptionIn2000Till28022023,
            // onPointTap: (ChartPointDetails pt) {
            //   log("${pt.pointIndex}");
            // },
          ),
          BarSeries<Guarantee, String>(
              name: "Amount of cumulative",
              dataLabelSettings: DataLabelSettings(
                  // offset: const Offset(100, 100),
                  // color: const Color.fromARGB(255, 160, 51, 43),
                  // labelAlignment: ChartDataLabelAlignment.top,
                  isVisible: _mainController.seeAmount.value,
                  textStyle: const TextStyle(fontSize: 7)),
              dataSource: dataList,
              xValueMapper: (Guarantee gt, _) => gt.statesUts,
              yValueMapper: (Guarantee gt, _) =>
                  gt.amountOfCumulativeSinceInceptionIn2000Till28022023)
        ],
        primaryXAxis: CategoryAxis(
            isVisible: _mainController.seeStates.value,
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            labelPosition: ChartDataLabelPosition.inside,
            interval: 1,
            labelIntersectAction: AxisLabelIntersectAction.hide,
            labelPlacement: LabelPlacement.onTicks,
            autoScrollingMode: AutoScrollingMode.start,
            labelStyle: const TextStyle(fontSize: 15, color: Colors.black)),
        primaryYAxis: NumericAxis(
          isVisible: true,
          maximum: 760000,
          interval: 300000,
          labelIntersectAction: AxisLabelIntersectAction.hide,
          majorGridLines: const MajorGridLines(),
          // title: AxisTitle(
          //     text:
          //         "amount_of_cumulative_since_inception_in_2000_till_28_02_2023"),
        ),
      ),
    );
  }
}
