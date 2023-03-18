// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yourguide/controller/markscontrollers/fourthgradecontroller.dart';
import 'package:yourguide/view/widgets/Appbar/appbartext.dart';
import 'package:yourguide/view/widgets/General/customfieldhomepage.dart';

import '../../../component/constant/colors.dart';
import '../../widgets/HomePage/bodyrowcustom.dart';
import '../../widgets/Text/customtext.dart';

class FourthGrade extends StatelessWidget {
  const FourthGrade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FourthGradePageControllerImpl controller =
        Get.put(FourthGradePageControllerImpl());
    return Scaffold(
        appBar: AppBar(
          title: const AppBarText(
            text: 'حساب المعدل من 4',
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.primary,
        ),
        body: GetBuilder<FourthGradePageControllerImpl>(
          builder: (controller) => ListView(shrinkWrap: true, children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 50,
                          child: CustomFieldHomePage(
                            controller: controller.controller1,
                          ),
                        ),
                        const CustomText(text: "المعدل التراكمي الحالي"),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 50,
                            child: CustomFieldHomePage(
                              controller: controller.controller2,
                            ),
                          ),
                          const CustomText(text: "عدد الساعات المقطوعة"),
                        ]),
                  ]),
            ),
            const Divider(
              color: Colors.black,
            ),
           
            BodyRow(
                text: ' الأولى ',
                hint: 'العلامة',
                controller: controller.firstController,
                onChanged: (i) {
                  controller.value = i!;
                  controller.changevalue();
                },
                value: controller.value),
            BodyRow(
                text: ' الثانية ',
                hint: 'العلامة',
                controller: controller.secondController,
                onChanged: (i) {
                  controller.value2 = i!;
                  controller.changevalue();
                },
                value: controller.value2),
            BodyRow(
                text: ' الثالثة ',
                hint: 'العلامة',
                controller: controller.thirdController,
                onChanged: (i) {
                  controller.value3 = i!;
                  controller.changevalue();
                },
                value: controller.value3),
            BodyRow(
                text: ' الرابعة ',
                hint: 'العلامة',
                controller: controller.fourthController,
                onChanged: (i) {
                  controller.value4 = i!;
                  controller.changevalue();
                },
                value: controller.value4),
            BodyRow(
                text: ' الخامسة ',
                hint: 'العلامة',
                controller: controller.fifthController,
                onChanged: (i) {
                  controller.value5 = i!;
                  controller.changevalue();
                },
                value: controller.value5),
            BodyRow(
                text: ' السادسة ',
                hint: 'العلامة',
                controller: controller.sixthController,
                onChanged: (i) {
                  controller.value6 = i!;
                  controller.changevalue();
                },
                value: controller.value6),
            BodyRow(
                text: ' السابعة ',
                hint: 'العلامة',
                controller: controller.seventhController,
                onChanged: (i) {
                  controller.value7 = i!;
                  controller.changevalue();
                },
                value: controller.value7),
            controller.isAdLoaded
                ? SizedBox(
                    height: controller.bannerAd.size.height.toDouble(),
                    width: controller.bannerAd.size.width.toDouble(),
                    child: AdWidget(ad: controller.bannerAd),
                  )
                : const SizedBox(),
            Container(
              margin: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  controller.calc();
                  Get.bottomSheet(
                      Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: AppColor.backgroundColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    controller.result.isNaN
                                        ? ""
                                        : controller.result.toStringAsFixed(1),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Cairo")),
                                const Text(": المعدل الفصلي الحالي",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Cairo")),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    controller.finalMark.isNaN
                                        ? ""
                                        : controller.finalMark
                                            .toStringAsFixed(1),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Cairo")),
                                const Text(": المعدل التراكمي الحالي",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Cairo")),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(controller.totalHours.toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Cairo")),
                                const Text(": عدد الساعات المقطوعة اصبح ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Cairo")),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    width: 120,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'حسنا',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Cairo',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.bottomSheet(Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.30,
                                        padding: const EdgeInsets.all(30),
                                        decoration: BoxDecoration(
                                          color: AppColor.primary,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const Text(
                                                'أدخل اسم الفصل',
                                                style: TextStyle(
                                                  color: AppColor.textColor,
                                                  fontSize: 18,
                                                  fontFamily: 'Cairo',
                                                ),
                                              ),
                                              CustomFieldHomePage(
                                                  text: 1,
                                                  controller: controller.sName),
                                              GestureDetector(
                                                onTap: () async {
                                                  await controller.isertData(
                                                      controller.sName.text
                                                          .toString(),
                                                      controller.finalMark
                                                          .toStringAsFixed(2));
                                                  Get.back();
                                                  Get.back();
                                                },
                                                child: Container(
                                                  height: 55,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      'احفظ',
                                                      style: TextStyle(
                                                        color: AppColor.textColor,
                                                        fontSize: 18,
                                                        fontFamily: 'Cairo',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )));
                                  },
                                  child: Container(
                                    width: 120,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'حفظ المعدل',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Cairo',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      isDismissible: false);
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      'أحسب',
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 18,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
