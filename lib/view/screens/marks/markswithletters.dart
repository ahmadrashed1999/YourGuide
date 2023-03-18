import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:yourguide/controller/markscontrollers/markswithletterscont.dart';
import 'package:yourguide/view/widgets/Appbar/appbartext.dart';
import 'package:yourguide/view/widgets/General/bodyrowforletters.dart';
import 'package:yourguide/view/widgets/General/customfieldhomepage.dart';

import '../../../component/constant/colors.dart';
import '../../widgets/Text/customtext.dart';

class MarksWithLetters extends StatelessWidget {
  const MarksWithLetters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    MarksWithLetterePageControllerImpl controller =
        Get.put(MarksWithLetterePageControllerImpl());
    return Scaffold(
        appBar: AppBar(
          title: const AppBarText(
            text: 'حساب المعدل بالأحرف',
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.primary,
        ),
        body: GetBuilder<MarksWithLetterePageControllerImpl>(
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
            controller.isAdLoaded
                ? SizedBox(
                    height: controller.bannerAd.size.height.toDouble(),
                    width: controller.bannerAd.size.width.toDouble(),
                    child: AdWidget(ad: controller.bannerAd),
                  )
                : const SizedBox(),
            const Divider(
              color: Colors.black,
            ),
            // const BodyRow(
            //   text: "المعدل التراكمي الحالي",
            // ),
            BodyRowLetters(
                text: ' الأولى',
                letters: controller.letters,
                hint: '',
                onChanged: (i) {
                  controller.value = i!;

                  controller.changevalue();
                },
                onChanged2: (i) {
                  controller.letters = i!;
                  controller.changevalue1(i);
                },
                value: controller.value),
            BodyRowLetters(
                text: ' الثانية',
                letters: controller.letters2,
                hint: '',
                onChanged: (i) {
                  controller.value2 = i!;
                  controller.changevalue();
                },
                onChanged2: (i) {
                  controller.letters2 = i!;
                  controller.changevalue2(i);
                },
                value: controller.value2),
            BodyRowLetters(
                text: ' الثالثة',
                letters: controller.letters3,
                hint: '',
                onChanged: (i) {
                  controller.value3 = i!;
                  controller.changevalue();
                },
                onChanged2: (i) {
                  controller.letters3 = i!;
                  controller.changevalue3(i);
                },
                value: controller.value3),
            BodyRowLetters(
                text: ' الرابعة',
                letters: controller.letters4,
                hint: '',
                onChanged: (i) {
                  controller.value4 = i!;
                  controller.changevalue();
                },
                onChanged2: (i) {
                  controller.letters4 = i!;
                  controller.changevalue4(i);
                },
                value: controller.value4),
            BodyRowLetters(
                text: ' الخامسة',
                letters: controller.letters5,
                hint: '',
                onChanged: (i) {
                  controller.value5 = i!;
                  controller.changevalue();
                },
                onChanged2: (i) {
                  controller.letters5 = i!;
                  controller.changevalue5(i);
                },
                value: controller.value5),
            BodyRowLetters(
                text: ' السادسة',
                letters: controller.letters6,
                hint: '',
                onChanged: (i) {
                  controller.value6 = i!;
                  controller.changevalue();
                },
                onChanged2: (i) {
                  controller.letters6 = i!;
                  controller.changevalue6(i);
                },
                value: controller.value6),
            BodyRowLetters(
                text: ' السابعة',
                letters: controller.letters7,
                hint: '',
                onChanged: (i) {
                  controller.value7 = i!;
                  controller.changevalue();
                },
                onChanged2: (i) {
                  controller.letters7 = i!;
                  controller.changevalue7(i);
                },
                value: controller.value7),

            Container(
              margin: const EdgeInsets.all(10),
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
                                        : controller.result.toStringAsFixed(3),
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
                                            .toStringAsFixed(3),
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
