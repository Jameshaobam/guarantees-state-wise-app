import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../data/guarantee.dart';

class ModalGraph extends StatefulWidget {
  const ModalGraph({super.key, required this.chartData});
  final List<Guarantee> chartData;
  @override
  State<ModalGraph> createState() => _ModalGraphState();
}

class _ModalGraphState extends State<ModalGraph> {
  late List<Guarantee> _chartData;

  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
  }

  TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);

  List<Guarantee> getChartData() {
    final List<Guarantee> chartData = [
      Guarantee.fromJson({
        "sr_no_": "4",
        "states_uts": "Assam",
        "number_of_cumulative_since_inception_in_2000_till_28_02_2023": 172998,
        "amount_of_cumulative_since_inception_in_2000_till_28_02_2023": 8944
      }),
      Guarantee.fromJson({
        "sr_no_": "5",
        "states_uts": "Bihar",
        "number_of_cumulative_since_inception_in_2000_till_28_02_2023": 273702,
        "amount_of_cumulative_since_inception_in_2000_till_28_02_2023": 14639
      }),
      Guarantee.fromJson({
        "sr_no_": "6",
        "states_uts": "Chandigarh",
        "number_of_cumulative_since_inception_in_2000_till_28_02_2023": 20490,
        "amount_of_cumulative_since_inception_in_2000_till_28_02_2023": 1422
      }),
      Guarantee.fromJson({
        "sr_no_": "9",
        "states_uts": "Delhi",
        "number_of_cumulative_since_inception_in_2000_till_28_02_2023": 125036,
        "amount_of_cumulative_since_inception_in_2000_till_28_02_2023": 16050
      }),
    ];

    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      width: double.infinity,
      child: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //   Container(
              //       width: 400,
              //       height: 300,
              //       child: BarChart(BarChartData(barGroups: [
              //         BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 5)]),
              //         BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 5)]),
              //         BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 5)])
              //       ])))

              Container(
                width: double.infinity,
                height: 1500,

                // child: BarChart(BarChartData(
                //   barGroups: widget.chartData
                //       .map(
                //         (e) => BarChartGroupData(
                //           x: e.amountOfCumulativeSinceInceptionIn2000Till28022023,
                //           barRods: [
                //             BarChartRodData(
                //                 toY: double.parse(
                //                     "${e.amountOfCumulativeSinceInceptionIn2000Till28022023}"))
                //           ],
                //         ),
                //       )
                //       .toList(),
                // )),

                child: SfCartesianChart(
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
                        dataLabelSettings: const DataLabelSettings(
                            isVisible: true, textStyle: TextStyle(fontSize: 7)),
                        dataSource: widget.chartData,
                        xValueMapper: (Guarantee gt, _) => gt.statesUts,
                        yValueMapper: (Guarantee gt, _) => gt
                            .numberOfCumulativeSinceInceptionIn2000Till28022023),
                    BarSeries<Guarantee, String>(
                        name: "Number of cumulative",
                        dataLabelSettings: const DataLabelSettings(
                            offset: Offset(100, 100),
                            color: Color.fromARGB(255, 160, 51, 43),
                            labelAlignment: ChartDataLabelAlignment.top,
                            isVisible: true,
                            textStyle: TextStyle(fontSize: 7)),
                        dataSource: widget.chartData,
                        xValueMapper: (Guarantee gt, _) => gt.statesUts,
                        yValueMapper: (Guarantee gt, _) => gt
                            .amountOfCumulativeSinceInceptionIn2000Till28022023)
                  ],
                  primaryXAxis: CategoryAxis(
                      isVisible: true,
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      labelPosition: ChartDataLabelPosition.inside,
                      interval: 1,
                      labelIntersectAction: AxisLabelIntersectAction.hide,
                      labelPlacement: LabelPlacement.onTicks,
                      autoScrollingMode: AutoScrollingMode.start,
                      labelStyle: TextStyle(fontSize: 15, color: Colors.black)),
                  primaryYAxis: NumericAxis(
                    isVisible: true,
                    maximum: 600000,
                    interval: 300000,
                    labelIntersectAction: AxisLabelIntersectAction.hide,
                    majorGridLines: MajorGridLines(),
                    // title: AxisTitle(
                    //     text:
                    //         "amount_of_cumulative_since_inception_in_2000_till_28_02_2023"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
