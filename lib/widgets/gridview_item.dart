import 'dart:math';

import 'package:data_visual_cubeten/data/guarantee.dart';
import 'package:data_visual_cubeten/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.guarantee});
  final Guarantee guarantee;

  Color getRandomColor() {
    List<Color> colorList = [
      const Color.fromARGB(255, 150, 95, 107),
      const Color.fromARGB(255, 85, 137, 167),

      // Add more colors as needed
    ];

    Random random = Random();
    return colorList[random.nextInt(colorList.length)];
  }

  @override
  Widget build(BuildContext context) {
    Color randomColor = getRandomColor();
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Card(
          color: randomColor,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Expanded(
                      child: Icon(
                    FontAwesomeIcons.chartColumn,
                    size: 17.0,
                  )),
                  Text(
                    "${guarantee.statesUts}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getAdaptiveSize(context, 15),
                    ),
                  ),
                  SizedBox(
                    height: getAdaptiveSize(context, 10),
                  ),
                  Text(
                    "Number of cumulatives ${guarantee.numberOfCumulativeSinceInceptionIn2000Till28022023}",
                    style: TextStyle(
                        fontSize: getAdaptiveSize(context, 7),
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  SizedBox(
                    height: getAdaptiveSize(context, 10),
                  ),
                  Text(
                    "Amount of cumulatives ${guarantee.amountOfCumulativeSinceInceptionIn2000Till28022023}",
                    style: TextStyle(
                      fontSize: getAdaptiveSize(context, 7),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
