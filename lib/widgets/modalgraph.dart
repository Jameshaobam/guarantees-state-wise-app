import 'package:data_visual_cubeten/widgets/individualbar.dart';
import 'package:data_visual_cubeten/widgets/piechart.dart';

import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      width: double.infinity,
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                Text(widget.guaranteeList[widget.index].statesUts),
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
