import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../data/database.dart';

abstract class MarksWithLetterPageController extends GetxController {
  changevalue();
  // changevalue2();
  calc();
}

class MarksWithLetterePageControllerImpl extends MarksWithLetterPageController {
  // ignore: unused_field
  late TextEditingController controller1 = TextEditingController();

  late BannerAd bannerAd;
  bool isAdLoaded = false;
  void initBannerAd() async {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-2902051447809378/7384351175',
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

  late TextEditingController controller2 = TextEditingController();
  late TextEditingController sName = TextEditingController();

  late int value;
  late int value2;
  late int value3;
  late int value4;
  late int value5;
  late int value6;
  late int value7;
  late String letters;
  late String letters2;
  late String letters3;
  late String letters4;
  late String letters5;
  late String letters6;
  late String letters7;
  double l1 = 0;
  double l2 = 0;
  double l3 = 0;
  double l4 = 0;
  double l5 = 0;
  double l6 = 0;
  double l7 = 0;
  bool b1 = false;
  bool b2 = false;
  bool b3 = false;
  bool b4 = false;
  bool b5 = false;
  bool b6 = false;
  bool b7 = false;

  int currentIndex = 0;
  Sql sql = Sql();

  late int a;
  double result = 0;
  int numberOfHours = 0;
  int totalHours = 0;
  double finalMark = 0;
  isertData(name, mark) async {
    a = await sql
        .insertData('INSERT INTO marks (name, mark) VALUES("$name", "$mark")');
    if (a == 1) {}
  }

  @override
  changevalue() {
    update();
  }

  changevalue1(l) {
    l1 = convertletters(l);
    b1 = true;
    update();
  }

  changevalue2(l) {
    l2 = convertletters(l);
    b2 = true;
    update();
  }

  changevalue3(l) {
    l3 = convertletters(l);
    b3 = true;
    update();
  }

  changevalue4(l) {
    l4 = convertletters(l);
    b4 = true;
    update();
  }

  changevalue5(l) {
    l5 = convertletters(l);
    b5 = true;
    update();
  }

  changevalue6(l) {
    l6 = convertletters(l);
    b6 = true;
    update();
  }

  changevalue7(l) {
    l7 = convertletters(l);
    b7 = true;
    update();
  }

  convertletters(l) {
    switch (l) {
      case 'أ':
        l = 4.0;
        break;
      case 'أ-':
        l = 3.75;
        break;
      case 'ب+':
        l = 3.5;
        break;
      case 'ب':
        l = 3.0;
        break;
      case 'ب-':
        l = 2.75;
        break;
      case 'ج+':
        l = 2.5;
        break;
      case 'ج':
        l = 2.0;
        break;
      case 'ج-':
        l = 1.75;
        break;
      case 'د+':
        l = 1.5;
        break;
      case 'د':
        l = 1.0;
        break;
      case 'د-':
        l = 0.75;
        break;
      case 'ه':
        l = 0;
        break;
      default:
    }
    return l;
  }

  @override
  calc() {
    if (controller1.text == "" || controller2.text == "") {
      controller1.text = "0";
      controller2.text = "0";
    }
    if (!b1) {
      value = 0;
      value2 = 0;
      value3 = 0;
      value4 = 0;
      value5 = 0;
      value6 = 0;
      value7 = 0;
    }
    if (!b2) {
      value2 = 0;
      value3 = 0;
      value4 = 0;
      value5 = 0;
      value6 = 0;
      value7 = 0;
    }
    if (!b3) {
      value3 = 0;
      value4 = 0;
      value5 = 0;
      value6 = 0;
      value7 = 0;
    }
    if (!b4) {
      value4 = 0;
      value5 = 0;
      value6 = 0;
      value7 = 0;
    }
    if (!b5) {
      value5 = 0;
      value6 = 0;
      value7 = 0;
    }
    if (!b6) {
      value6 = 0;
      value7 = 0;
    }
    if (!b7) {
      value7 = 0;
      // }

      result = ((l1 * value) +
              (l2 * value2) +
              (l3 * value3) +
              (l4 * value4) +
              (l5 * value5) +
              (l6 * value6) +
              (l7 * value7)) /
          (value + value2 + value3 + value4 + value5 + value6 + value7);
      numberOfHours =
          value + value2 + value3 + value4 + value5 + value6 + value7;
      totalHours = (numberOfHours + int.parse(controller2.text));
      finalMark =
          ((double.parse(controller1.text) * int.parse(controller2.text)) +
                  (result * numberOfHours)) /
              (totalHours);
      update();
    }
  }

  @override
  void onInit() {
    // initBannerAd();
    value = 3;
    value2 = 3;
    value3 = 3;
    value4 = 3;
    value5 = 3;
    value6 = 3;
    value7 = 3;
    letters = "أ";
    letters2 = "أ";
    letters3 = "أ";
    letters4 = "أ";
    letters5 = "أ";
    letters6 = "أ";
    letters7 = "أ";
    super.onInit();
  }
}
