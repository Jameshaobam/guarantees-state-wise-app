import 'package:data_visual_cubeten/controller/get_main_controller.dart';
import 'package:data_visual_cubeten/widgets/barwidget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ChartScreen extends StatefulHookWidget {
  const ChartScreen({super.key});
  static String routeName = "/chart-page";
  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final MainController _mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> gSize = useState("M");
    Map<String, double> sizeMap = {
      "S": 800,
      "M": 1300,
      "L": 2000,
    };
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(FontAwesomeIcons.arrowLeft))
              ],
            ),
            Row(
              children: [
                Obx(
                  () => TextButton(
                    onPressed: () {
                      bool val = _mainController.seeStates.value;
                      _mainController.updateSeeStates(!val);
                    },
                    child: Text(
                      "States",
                      style: TextStyle(
                          color: _mainController.seeStates.value
                              ? Colors.red
                              : Colors.black),
                    ),
                  ),
                ),
                Obx(
                  () => TextButton(
                    onPressed: () {
                      bool val = _mainController.seeAmount.value;
                      _mainController.updateSeeAmount(!val);
                    },
                    child: Text(
                      "Amount",
                      style: TextStyle(
                          color: _mainController.seeAmount.value
                              ? Colors.red
                              : Colors.black),
                    ),
                  ),
                ),
                Obx(
                  () => TextButton(
                    onPressed: () {
                      bool val = _mainController.seeNum.value;
                      _mainController.updateSeeNum(!val);
                    },
                    child: Text(
                      "Number",
                      style: TextStyle(
                          color: _mainController.seeNum.value
                              ? Colors.red
                              : Colors.black),
                    ),
                  ),
                ),
              ],
            ),

            // ignore: prefer_const_constructors
            Row(
              children: const [
                Icon(
                  FontAwesomeIcons.solidCircle,
                  size: 15.0,
                  color: Color.fromARGB(255, 209, 110, 103),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  "Amount of cummulative",
                  style: TextStyle(fontSize: 10.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Icon(
                  size: 15.0,
                  FontAwesomeIcons.solidCircle,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  "Number of cummulative",
                  style: TextStyle(fontSize: 10.0),
                )
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),

            Row(
              children: [
                Text("Graph size:"),
                TextButton(
                    onPressed: () {
                      gSize.value = "S";
                    },
                    child: Text("S",
                        style: TextStyle(
                            color: gSize.value == "S"
                                ? Colors.red
                                : Colors.black))),
                TextButton(
                  onPressed: () {
                    gSize.value = "M";
                  },
                  child: Text(
                    "M",
                    style: TextStyle(
                        color: gSize.value == "M" ? Colors.red : Colors.black),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      gSize.value = "L";
                    },
                    child: Text("L",
                        style: TextStyle(
                            color: gSize.value == "L"
                                ? Colors.red
                                : Colors.black))),
              ],
            ),

            //Chart region

            //TODO: Always expanded on top

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: sizeMap[gSize.value],
                      child: barChartWidget(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
