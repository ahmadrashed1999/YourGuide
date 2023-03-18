import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:yourguide/data/database.dart';
import 'package:yourguide/view/screens/baseicScreen/homescreen.dart';

import '../../data/model/taskmodel.dart';

abstract class AddTaskController extends GetxController {}

class AddTaskControllerImp extends AddTaskController {
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

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  int selectedColor = 0;
  void changecolor(index) {
    selectedColor = index;
    update();
  }

  String startTime =
      DateFormat('hh:mm a').format(DateTime(2023, 1, 1, 8, 0)).toString();
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(hours: 1)))
      .toString();
  void getDateFromUser(context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    if (pickedDate != null) {
      selectedDate = pickedDate;
      update();
    } else {}


  }

  void getTimeFromUser(context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime(2023, 1, 1, 8, 0)),
    );

    if (pickedTime != null) {
      String formaTtedTime = pickedTime.format(context);

      startTime = formaTtedTime;
      update();
    } else {}
  }

  addtodatapase() {
    Random rnd = Random();
    int min = 100000;
    int max = 999999;
    int r = min + rnd.nextInt(max - min);
    Task task = Task(
        notificationid: r.toString(),
        title: titleController.text,
        description: descriptionController.text,
        color: selectedColor,
        day: DateFormat('EEEE').format(selectedDate),
        hour: startTime,
        time: selectedDate,
        done: 0);

    Sql sql = Sql();
    Map<String, dynamic> taskMap = task.toMap();
    sql.insert('tasks', taskMap);

    scheduleNotification(
        r.toString(),
        selectedDate,
        titleController.text,
        DateFormat('EEEE').format(selectedDate),
        startTime,
        descriptionController.text);
    Get.offAll(() => const HomeScreen());
  }

  @override
  void onInit() {
    // initBannerAd();

    super.onInit();
  }
}
