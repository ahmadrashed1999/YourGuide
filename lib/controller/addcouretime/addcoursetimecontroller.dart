// ignore_for_file: prefer_final_fields, unused_field, no_leading_underscores_for_local_identifiers

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:yourguide/component/constant/colors.dart';
import 'package:yourguide/controller/basic/homepagecontroller.dart';
import 'package:yourguide/controller/basic/schedualpagecontroller.dart';
import 'package:yourguide/data/database.dart';
import 'package:yourguide/view/screens/baseicScreen/homescreen.dart';

import '../../view/widgets/General/dialogbody.dart';

abstract class AddCourseTimeCotroller extends GetxController {}

class AddCourseTimeCotrollerImp extends AddCourseTimeCotroller {
  late BannerAd bannerAd;
  bool isAdLoaded = false;
  void initBannerAd() async {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-2902051447809378/8098667049',
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

  int selectedColor = 0;
  void changecolor(index) {
    selectedColor = index;
    update();
  }

  DateTime _selectedDate = DateTime.now();
  String startTime =
      DateFormat('hh:mm a').format(DateTime(2023, 1, 1, 8, 0)).toString();
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(hours: 1)))
      .toString();
  SchedualPageControllerImp s = SchedualPageControllerImp();

  List<Object?> selected = [];
  Sql sql = Sql();
  TextEditingController textController = TextEditingController();
  addToDataBase(context) async {
    var days = selected.join(',');

    await sql.insertData(
        'INSERT INTO timing (name, timeFrom,timeTo,color,days) VALUES("${textController.text}", "$startTime", "$endTime","$selectedColor","$days")');
    // ignore: avoid_single_cascade_in_expression_statements
    AwesomeDialog(
            context: context,
            dismissOnTouchOutside: false,
            animType: AnimType.scale,
            dialogType: DialogType.success,
            // ignore: prefer_const_constructors
            body: DialogBody(),
            title: "تم اضافة المادة الى الجدول",
            btnOkOnPress: () {
              textController.clear();
              startTime = DateFormat('hh:mm a')
                  .format(DateTime(2023, 1, 1, 8, 0))
                  .toString();
              endTime = DateFormat('hh:mm a')
                  .format(DateTime(2023, 1, 1, 8, 0)
                      .add(const Duration(minutes: 60)))
                  .toString();
            },
            btnOkColor: AppColor.primary,
            btnOkText: 'إضافة',
            btnCancelOnPress: () {
              HomePageControllerImpl h = HomePageControllerImpl();
              h.currentIndex = 0;
              h.update();
              Get.offAll(() => const HomeScreen());
            },
            btnCancelColor: AppColor.backgroundColor,
            btnCancelText: 'الصفحة الرئيسيسة')
        .show();
  }

  void getTimeFromUser(context, {required bool isStartTime}) async {
    TimeOfDay? _pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime
          ? TimeOfDay.fromDateTime(DateTime(2023, 1, 1, 8, 0))
          : TimeOfDay.fromDateTime(
              DateTime(2023, 1, 1, 8, 0).add(const Duration(minutes: 60))),
    );

    if (_pickedTime != null) {
      String _formaTtedTime = _pickedTime.format(context);

      if (isStartTime) {
        startTime = _formaTtedTime;

        update();
      } else if (!isStartTime) {
        endTime = _formaTtedTime;

        update();
      } else {}
    } else {}
  }

  @override
  void onInit() {
    initBannerAd();

    super.onInit();
  }
}
