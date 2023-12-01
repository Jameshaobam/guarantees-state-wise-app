import 'dart:developer';

import 'package:data_visual_cubeten/controller/get_main_controller.dart';
import 'package:data_visual_cubeten/data/guarantee.dart';
import 'package:data_visual_cubeten/utility/utils.dart';
import 'package:data_visual_cubeten/widgets/barwidget.dart';
import 'package:data_visual_cubeten/widgets/piechartwhole.dart';
import 'package:data_visual_cubeten/widgets/singleBar.dart';
import 'package:data_visual_cubeten/widgets/singlepie.dart';
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

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> gSize = useState("M");
    ValueNotifier<String> drpdwnValue = useState("All");
    ValueNotifier<Guarantee?> individual = useState(null);

    List<Map<String, dynamic>> stWithIdx =
        _mainController.stateWithIndexList.value;
    Map<String, dynamic> stateMap = {};

    for (Map<String, dynamic> map in stWithIdx) {
      stateMap[map["state"]] = map["idx"];
    }
    List<String> nameOfStates = ["All"];

    for (Map<String, dynamic> ele in stWithIdx) {
      nameOfStates.add(ele["state"]);
    }

    Map<String, double> sizeMap = {
      "S": 800,
      "M": 1300,
      "L": 2000,
    };

    log(drpdwnValue.value.toString());
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Obx(
                  () => TextButton(
                    onPressed: drpdwnValue.value != "All"
                        ? null
                        : () {
                            bool val = _mainController.seeStates.value;
                            _mainController.updateSeeStates(!val);
                          },
                    child: Text(
                      "States",
                      style: TextStyle(
                          decoration: drpdwnValue.value != "All"
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: _mainController.seeStates.value
                              ? Color(0xFF67729D)
                              : Colors.black),
                    ),
                  ),
                ),
                Obx(
                  () => TextButton(
                    onPressed: drpdwnValue.value != "All"
                        ? null
                        : () {
                            bool val = _mainController.seeAmount.value;
                            _mainController.updateSeeAmount(!val);
                          },
                    child: Text(
                      "Amount",
                      style: TextStyle(
                          decoration: drpdwnValue.value != "All"
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: _mainController.seeAmount.value
                              ? Color(0xFF67729D)
                              : Colors.black),
                    ),
                  ),
                ),
                Obx(
                  () => TextButton(
                    onPressed: drpdwnValue.value != "All"
                        ? null
                        : () {
                            bool val = _mainController.seeNum.value;
                            _mainController.updateSeeNum(!val);
                          },
                    child: Text(
                      "Number",
                      style: TextStyle(
                          decoration: drpdwnValue.value != "All"
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: _mainController.seeNum.value
                              ? Color(0xFF67729D)
                              : Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),

                //TODO: Filter by states drop down button
                DropdownButton(
                  // Initial Value
                  value: drpdwnValue.value,

                  // Down Arrow Icon
                  icon: const Icon(FontAwesomeIcons.bars),

                  // Array list of items
                  items: nameOfStates
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: SizedBox(
                              width: 70,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                e,
                                style: TextStyle(
                                    fontSize: getAdaptiveSize(context, 10.0)),
                              ),
                            ),
                          ))
                      .toList(),

                  onChanged: (String? newValue) {
                    drpdwnValue.value = newValue!;

                    if (newValue != "All") {
                      print(_mainController.dataList.value[stateMap[newValue]]);
                      individual.value =
                          _mainController.dataList.value[stateMap[newValue]];
                    }
                  },
                ),
              ],
            ),

            // ignore: prefer_const_constructors
            Row(
              children: const [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.solidCircle,
                        size: 15.0,
                        color: Color.fromARGB(255, 209, 110, 103),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "Amount of cumulative",
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        size: 15.0,
                        FontAwesomeIcons.solidCircle,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "Number of cumulative",
                        style: TextStyle(fontSize: 10.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),

            drpdwnValue.value == "All"
                ? Row(
                    children: [
                      const Text("Graph size:"),
                      TextButton(
                          onPressed: () {
                            gSize.value = "S";
                          },
                          child: Text("S",
                              style: TextStyle(
                                  color: gSize.value == "S"
                                      ? Color(0xFF67729D)
                                      : Colors.black))),
                      TextButton(
                        onPressed: () {
                          gSize.value = "M";
                        },
                        child: Text(
                          "M",
                          style: TextStyle(
                              color: gSize.value == "M"
                                  ? Color(0xFF67729D)
                                  : Colors.black),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            gSize.value = "L";
                          },
                          child: Text("L",
                              style: TextStyle(
                                  color: gSize.value == "L"
                                      ? Color(0xFF67729D)
                                      : Colors.black))),
                    ],
                  )
                : Container(),

            //Chart region

            //TODO: Always expanded on top

            Expanded(
              child: SingleChildScrollView(
                child: drpdwnValue.value == "All"
                    ? Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: sizeMap[gSize.value],
                            child: BarChartWidget(),
                          ),
                          SizedBox(
                            height: 300,
                            width: 500,
                            child: PieChartWhole(),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text('Total Amount Guarantee ')
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 200,
                            child: SingleBar(chartData: individual.value!),
                          ),
                          SizedBox(
                            height: 500,
                            width: 500,
                            child: SinglePie(guarantee: individual.value!),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          drpdwnValue.value == "All"
                              ? Text('Total Amount Guarantee ')
                              : Container()
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
