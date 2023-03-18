import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yourguide/component/constant/colors.dart';
import 'package:yourguide/data/database.dart';
import 'package:yourguide/data/model/taskmodel.dart';

abstract class TaskController extends GetxController {}

class TaskControllerImp extends TaskController {
  Sql sql = Sql();
  List<Task> tasks = [];

  Future<void> fetchTasks() async {
    List<Map> taskMaps = await sql.read('tasks');
    tasks = taskMaps.map((taskMap) => Task.fromJson(taskMap)).toList();

    update();
  }

  String dateFormat(date) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(date).toString();

    return formattedDate;
  }

  completeTask(id) {
    Sql sql = Sql();
    sql.updateData('UPDATE tasks SET done = 1 WHERE id = ${id}');
    update();
  }

  String getArabicDay(String day) {
    switch (day) {
      case "Monday":
        return "الإثنين";
      case "Tuesday":
        return "الثلاثاء";
      case "Wednesday":
        return "الأربعاء";
      case "Thursday":
        return "الخميس";
      case "Friday":
        return "الجمعة";
      case "Saturday":
        return "السبت";
      case "Sunday":
        return "الأحد";
      default:
        return day;
    }
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

  // Future<void> deleteTask(Task task) async {
  //   await sql.delete('tasks',);

  //   // remove task from tasks list
  //   tasks.removeWhere((t) => t.id == task.id);
  // }

  onrefresh() {
    fetchTasks();
  }

  @override
  void onInit() {
    fetchTasks();
    super.onInit();
  }
}
