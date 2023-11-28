import 'dart:developer';

import 'package:data_visual_cubeten/http.dart';
import '../constants.dart';
import '../data/guarantee.dart';

Future<List<dynamic>> fetchData() async {
  List<Guarantee> guaranteeList = [];
  String title = "";
  try {
    var res =
        await dio.get("${END_POINT}?api-key=${API_KEY}&format=json&limit=1000");

    if (res.statusCode == 200) {
      // print(res.data);

      List<dynamic> records = res.data["records"];
      title = res.data["title"];

      // log(records.toString());

      print("=======================");

      for (Map<String, dynamic> data in records) {
        guaranteeList.add(Guarantee.fromJson(data));

        // if (data.isEmpty) {
        //   print("empty");
        // }
        // log(data.toString());
      }

      log("$title");
    } else {
      guaranteeList = [];
    }
  } catch (e) {
    log("Error occur in fetching data $e");
    guaranteeList = [];
  } finally {
    return [guaranteeList, title];
  }
}
