import 'package:data_visual_cubeten/data/guarantee.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SingleBar extends StatelessWidget {
  SingleBar({super.key, required this.chartData});
  final Guarantee chartData;

  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  @override
  Widget build(BuildContext context) {
    List<Guarantee> dataList = [chartData];
    return SfCartesianChart(
      tooltipBehavior: _tooltipBehavior,
      primaryXAxis: CategoryAxis(isVisible: false),
      series: <ChartSeries>[
        BarSeries<Guarantee, String>(
            width: 0.3,
            spacing: 0.2,
            name: "Number of Cumulative",
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            ),
            dataSource: dataList,
            xValueMapper: (Guarantee data, _) => data.statesUts,
            yValueMapper: (Guarantee data, _) =>
                data.numberOfCumulativeSinceInceptionIn2000Till28022023),
        BarSeries<Guarantee, String>(
          width: 0.3,
          spacing: 0.2,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          dataSource: dataList,
          xValueMapper: (Guarantee data, _) => data.statesUts,
          yValueMapper: (Guarantee data, _) =>
              data.amountOfCumulativeSinceInceptionIn2000Till28022023,
          name: 'Amount of Cumulative',
        ),
      ],
    );
  }
}
