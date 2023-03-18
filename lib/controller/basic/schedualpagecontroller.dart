// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:yourguide/data/database.dart';

import '../../component/constant/colors.dart';
import '../../data/model/tableInfoModel.dart';

abstract class SchedualPageController extends GetxController {}

class SchedualPageControllerImp extends SchedualPageController {
  // late RxList<Schedule> events = <Schedule>[].obs;
  final RxList<Schedule> taskList = <Schedule>[].obs;
  Sql db = Sql();
  check() {
    return taskList.isNotEmpty ? true : false;
  }

  getBGCLr(int? color) {
    switch (color) {
      case 0:
        return AppColor.primary;

      case 1:
        return AppColor.pinkClr;

      case 2:
        return AppColor.bluesky;
      case 3:
        return AppColor.pinky;
      case 4:
        return AppColor.pinkdark;

      default:
        return AppColor.orangeClr;
    }
  }

  Future<void> getTask() async {
    final tasks = await db.query('timing');
    taskList.assignAll(tasks.map((data) => Schedule.fromJson(data)).toList());
    update();
  }

  // addevents() async {
  //   print(events.length);
  //   var a = await db.read('timing');
  //   events.clear();

  //   events.assignAll( a.map((e) => Schedule.fromJson(e)));
  //   update();
  //   print(events.length);
  //   print('done');
  // }

  onrefresh() async {
    // taskList = <Schedule>[].obs;
    await getTask();
  }

  @override
  void onInit() {
    super.onInit();
    getTask();
  }
}
