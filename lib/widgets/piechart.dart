import 'package:data_visual_cubeten/data/guarantee.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartWidget extends StatelessWidget {
  PieChartWidget({super.key, required this.guarantee});
  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  final Guarantee guarantee;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        "label": "Number of Cumulative",
        "value": guarantee.numberOfCumulativeSinceInceptionIn2000Till28022023,
      },
      {
        "label": "Amount of Cumulative",
        "value": guarantee.amountOfCumulativeSinceInceptionIn2000Till28022023,
      },
    ];
    return SfCircularChart(
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        PieSeries<Map<String, dynamic>, String>(
          dataSource: data,
          radius: "50%",
          xValueMapper: (Map<String, dynamic> data, _) => data['label'],
          yValueMapper: (Map<String, dynamic> data, _) => data['value'],
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
          ),
        ),
      ],
    );
  }
}
