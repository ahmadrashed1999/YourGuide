import 'package:get/get.dart';

abstract class SettingsPagecontroller extends GetxController {}

class SettingsPagecontrollerImpl extends SettingsPagecontroller {
  bool isuni = true;
  bool iscollege = false;
  void changeFilter() {
    isuni = !isuni;
    update();
  }
}
