import 'package:data_visual_cubeten/data/guarantee.dart';
import 'package:data_visual_cubeten/networking/fetch.dart';
import 'package:data_visual_cubeten/screens/detail.dart';
import 'package:data_visual_cubeten/utility/utils.dart';
import 'package:data_visual_cubeten/widgets/gridview_item.dart';
import 'package:data_visual_cubeten/widgets/modalgraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fquery/fquery.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulHookWidget {
  const HomeScreen({super.key});
  static String routeName = "/home-page";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final guaranteeList = useQuery(["reponseData"], fetchData);

    if (guaranteeList.isLoading) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (guaranteeList.isFetching) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (guaranteeList.isError) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            guaranteeList.error.toString(),
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    if (guaranteeList.data == null || guaranteeList.data!.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            "No courses found",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    }
    String title = guaranteeList.data![1];

    List<Guarantee> dataList = guaranteeList.data![0];

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "States",
            style: TextStyle(
                color: Colors.black,
                fontSize: getAdaptiveSize(context, 20),
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.filter,
                    color: Colors.grey,
                  )),
              Text(
                'Filter',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Expanded(
              child: GridView.builder(
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
                          // Get.toNamed(DetailData.routeName);

                          showModalBottomSheet(
                            isScrollControlled: true,
                            isDismissible: false,
                            context: context,
                            builder: (context) {
                              List<Guarantee> dataPassed = [];
                              for (Guarantee ele in dataList) {
                                if (ele.statesUts == "Total") {
                                  continue;
                                } else {
                                  dataPassed.add(ele);
                                }
                              }
                              return ModalGraph(
                                chartData: dataPassed,
                              );
                            },
                          );
                        },
                        child: GridItem(guarantee: dataList[index]));
                  }))
        ],
      ),
    );
  }
}
