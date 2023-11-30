import 'package:data_visual_cubeten/data/guarantee.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  Rx<List<Guarantee>> dataList = Rx([]);

  void updateDataList(List<Guarantee> data) {
    dataList.value = data;

    dataList.refresh();
  }

  RxBool seeStates = RxBool(false);

  void updateSeeStates(bool flag) {
    seeStates.value = flag;
  }

  RxBool seeNum = RxBool(false);

  void updateSeeNum(bool flag) {
    seeNum.value = flag;
  }

  RxBool seeAmount = RxBool(false);

  void updateSeeAmount(bool flag) {
    seeAmount.value = flag;
  }
}
