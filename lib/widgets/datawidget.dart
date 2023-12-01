import 'package:flutter/material.dart';

import '../data/guarantee.dart';
import 'gridview_item.dart';
import 'modalgraph.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
    required this.dataList,
  });

  final List<Guarantee> dataList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 8.0, // Spacing between columns
          mainAxisSpacing: 8.0, // Spacing between rows
        ),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          if (dataList[index].srNo == "Total") {
            return null;
          }
          return GestureDetector(
            onTap: () {
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
            child: GridItem(guarantee: dataList[index]),
          );
        });
  }
}
