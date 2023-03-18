import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yourguide/data/database.dart';

abstract class FourthGradePageController extends GetxController {
  changevalue();
  goToResetPassword();
  onPageChange(int index);
  calc();
  void handleMenuButtonPressed();
}

class FourthGradePageControllerImpl extends FourthGradePageController {
  late BannerAd bannerAd;
  bool isAdLoaded = false;
  void initBannerAd() async {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-2902051447809378/7384351175',
        // ca-app-pub-9528541724744762/8906857428

        listener: BannerAdListener(
          onAdOpened: (l) {},
          onAdLoaded: (loaded) {
            isAdLoaded = true;
            update();
          },
          onAdClicked: (c) {},
          onAdClosed: (close) {},
        ),
        request: const AdRequest());
    await bannerAd.load();
  }

  // ignore: unused_field
  late AdvancedDrawerController advancedDrawerController;
  late int value;
  late int value2;
  late int value3;
  late int value4;
  late int value5;
  late int value6;
  late int value7;
  late TextEditingController controller1 = TextEditingController();
  late TextEditingController controller2 = TextEditingController();
  late TextEditingController firstController = TextEditingController();
  late TextEditingController secondController = TextEditingController();
  late TextEditingController thirdController = TextEditingController();
  late TextEditingController fourthController = TextEditingController();
  late TextEditingController fifthController = TextEditingController();
  late TextEditingController sixthController = TextEditingController();
  late TextEditingController seventhController = TextEditingController();
  late TextEditingController sName = TextEditingController();
  int currentIndex = 0;
  double result = 0;
  int numberOfHours = 0;
  int totalHours = 0;
  double finalMark = 0;
  Sql sql = Sql();
  late int a;
  @override
  changevalue() {
    update();
  }

  @override
  onPageChange(int index) {
    currentIndex = index;
    update();
  }

  @override
  goToResetPassword() {
    //Get.offAllNamed(AppRoutes.reset_password);
  }
  isertData(name, mark) async {
    a = await sql
        .insertData('INSERT INTO marks (name, mark) VALUES("$name", "$mark")');
    if (a == 1) {}
  }

  @override
  calc() {
    if (controller1.text == "" || controller2.text == "") {
      controller1.text = "0";
      controller2.text = "0";
    }
    if (firstController.text == "") {
      firstController.text = "0";
      secondController.text = "0";
      thirdController.text = "0";
      fourthController.text = "0";
      fifthController.text = "0";
      sixthController.text = "0";
      seventhController.text = "0";
      value = 0;
      value2 = 0;
      value3 = 0;
      value4 = 0;
      value5 = 0;
      value6 = 0;
      value7 = 0;
    }
    if (secondController.text == "") {
      secondController.text = "0";
      thirdController.text = "0";
      fourthController.text = "0";
      fifthController.text = "0";
      sixthController.text = "0";
      seventhController.text = "0";
      value2 = 0;
      value3 = 0;
      value4 = 0;
      value5 = 0;
      value6 = 0;
      value7 = 0;
    }
    if (thirdController.text == "") {
      thirdController.text = "0";
      fourthController.text = "0";
      fifthController.text = "0";
      sixthController.text = "0";
      seventhController.text = "0";

      value3 = 0;
      value4 = 0;
      value5 = 0;
      value6 = 0;
      value7 = 0;
    }
    if (fourthController.text == "") {
      fourthController.text = "0";
      fifthController.text = "0";
      sixthController.text = "0";
      seventhController.text = "0";
      value4 = 0;
      value5 = 0;
      value6 = 0;
      value7 = 0;
    } else if (fifthController.text == "") {
      fifthController.text = "0";
      sixthController.text = "0";
      seventhController.text = "0";
      value5 = 0;
      value6 = 0;
      value7 = 0;
    } else if (sixthController.text == "") {
      sixthController.text = "0";
      seventhController.text = "0";
      value6 = 0;
      value7 = 0;
    } else if (seventhController.text == "") {
      seventhController.text = "0";
      value7 = 0;
    }
    result = ((double.parse(firstController.text) * value) +
            (double.parse(secondController.text) * value2) +
            (double.parse(thirdController.text) * value3) +
            (double.parse(fourthController.text) * value4) +
            (double.parse(fifthController.text) * value5) +
            (double.parse(sixthController.text) * value6) +
            (double.parse(seventhController.text) * value7)) /
        (value + value2 + value3 + value4 + value5 + value6 + value7);
    numberOfHours = value + value2 + value3 + value4 + value5 + value6 + value7;
    totalHours = (numberOfHours + int.parse(controller2.text));
    finalMark =
        ((double.parse(controller1.text) * int.parse(controller2.text)) +
                (result * numberOfHours)) /
            (totalHours);
    update();
  }

  @override
  void handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    advancedDrawerController.showDrawer();
  }

  void handleMenuButtonPressedd() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    advancedDrawerController.hideDrawer();
  }

  @override
  void onInit() {
    // initBannerAd();
    advancedDrawerController = AdvancedDrawerController();
    value = 3;
    value2 = 3;
    value3 = 3;
    value4 = 3;
    value5 = 3;
    value6 = 3;
    value7 = 3;

    super.onInit();
  }
}
