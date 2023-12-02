import 'package:flutter/material.dart';

import '../data/guarantee.dart';
import 'gridview_item.dart';
import 'modalgraph.dart';

class DataWidget extends StatefulWidget {
  const DataWidget({
    super.key,
    required this.dataList,
  });

  final List<Guarantee> dataList;

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  late List<Guarantee> filteredDataList;

  @override
  void initState() {
    super.initState();
    filteredDataList = List.from(widget.dataList);
  }

  void filterData(String searchTerm) {
    setState(() {
      if (searchTerm.isEmpty) {
        filteredDataList = List.from(widget.dataList);
      } else {
        filteredDataList = widget.dataList
            .where((guarantee) => guarantee.statesUts
                .toLowerCase()
                .contains(searchTerm.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: filterData,
          decoration: const InputDecoration(
            labelText: 'Search by State/Ut',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 8.0, // Spacing between columns
              mainAxisSpacing: 8.0, // Spacing between rows
            ),
            itemCount: filteredDataList.length,
            itemBuilder: (context, index) {
              if (filteredDataList[index].srNo == "Total") {
                return Container(); // Return an empty container or a placeholder widget if needed
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
                        guaranteeList: filteredDataList,
                      );
                    },
                  );
                },
                child: GridItem(guarantee: filteredDataList[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
