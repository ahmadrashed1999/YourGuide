import 'package:get/get.dart';
import 'package:yourguide/main.dart';

abstract class MainPageController extends GetxController {}

class MainPageControllerImp extends MainPageController {
  late bool isRegister;
  @override
  void onInit() {
    isRegister = prefs.getBool('isUser') ?? false;
    super.onInit();
  }
}
