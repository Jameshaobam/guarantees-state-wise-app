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
      padding: const EdgeInsets.all(5.0),
      child: Card(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    color: Color(0xFF67729D),
                    child: Icon(
                      FontAwesomeIcons.chartColumn,
                      size: 17.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    width: 150,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      "${guarantee.statesUts}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: getAdaptiveSize(context, 15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //   children: [  SizedBox(
                      //   height: getAdaptiveSize(context, 10),
                      // ),
                      Text(
                        "Number: ${guarantee.numberOfCumulativeSinceInceptionIn2000Till28022023}",
                        style: TextStyle(
                            fontSize: getAdaptiveSize(context, 7),
                            color: Color(0xFF67729D)),
                      ),
                      SizedBox(
                        height: getAdaptiveSize(context, 10),
                      ),
                      Text(
                        "Amount: ${guarantee.amountOfCumulativeSinceInceptionIn2000Till28022023}",
                        style: TextStyle(
                          fontSize: getAdaptiveSize(context, 7),
                          color: Color(0xFF67729D),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
