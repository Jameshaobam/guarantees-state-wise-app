import 'package:data_visual_cubeten/widgets/barwidget.dart';
import 'package:data_visual_cubeten/widgets/individualbar.dart';
import 'package:data_visual_cubeten/widgets/piechart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../data/guarantee.dart';

class ModalGraph extends StatefulWidget {
  const ModalGraph({
    super.key,
    required this.guaranteeList,
    required this.index,
  });

  final List<Guarantee> guaranteeList;
  final int index;

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

  List<Guarantee> getChartData() {
    final List<Guarantee> chartData = [
      Guarantee.fromJson({
        "sr_no_": "4",
        "states_uts": "Assam",
        "number_of_cumulative_since_inception_in_2000_till_28_02_2023": 172998,
        "amount_of_cumulative_since_inception_in_2000_till_28_02_2023": 8944
      }),
      // Guarantee.fromJson({
      //   "sr_no_": "5",
      //   "states_uts": "Bihar",
      //   "number_of_cumulative_since_inception_in_2000_till_28_02_2023": 273702,
      //   "amount_of_cumulative_since_inception_in_2000_till_28_02_2023": 14639
      // }),
      // Guarantee.fromJson({
      //   "sr_no_": "6",
      //   "states_uts": "Chandigarh",
      //   "number_of_cumulative_since_inception_in_2000_till_28_02_2023": 20490,
      //   "amount_of_cumulative_since_inception_in_2000_till_28_02_2023": 1422
      // }),
      // Guarantee.fromJson({
      //   "sr_no_": "9",
      //   "states_uts": "Delhi",
      //   "number_of_cumulative_since_inception_in_2000_till_28_02_2023": 125036,
      //   "amount_of_cumulative_since_inception_in_2000_till_28_02_2023": 16050
      // }),
    ];

    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      width: double.infinity,
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                Text("${widget.guaranteeList[widget.index].statesUts}"),
                SizedBox(
                  width: 500,
                  height: 500,
                  child: IndividualBarWidget(
                      chartData: widget.guaranteeList[widget.index]),
                ),
                SizedBox(
                  height: 300,
                  child: PieChartWidget(
                      guarantee: widget.guaranteeList[widget.index]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
