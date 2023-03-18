// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yourguide/component/constant/colors.dart';
import 'package:yourguide/controller/TaskController/addtaskcontroller.dart';
import 'package:yourguide/view/widgets/Appbar/appbartext.dart';
import 'package:yourguide/view/widgets/Quizes/custombuttonquiz.dart';
import 'package:yourguide/view/widgets/SizedBox/SizedBoxhieght.dart';
import 'package:yourguide/view/widgets/Text/customtext.dart';
import 'package:yourguide/view/widgets/tasksWidgets/Taskpagewid/textfield.dart';

import '../../widgets/tasksWidgets/Taskpagewid/customtext.dart';

class AddTaskPage extends StatelessWidget {
  AddTaskControllerImp c = Get.put(AddTaskControllerImp());
  AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const AppBarText(text: 'اضف موعد'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColor.primary,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: GetBuilder<AddTaskControllerImp>(
              builder: ((controller) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(children: [
                                const CustomTextTask(
                                    text: 'اضف معلومات الموعد ليتم تذكيرك'),
                                const SizedBoxHieght(h: 20),
                                CustomTaskField(
                                    controller: controller.titleController,
                                    hint: 'أضف العنوان',
                                    text: 'العنوان'),
                                const SizedBoxHieght(h: 20),
                                CustomTaskField(
                                    controller:
                                        controller.descriptionController,
                                    hint: 'أضف الوصف',
                                    text: 'الوصف'),
                                const SizedBoxHieght(h: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const CustomText(text: 'ادخل التاريخ'),
                                    Column(
                                      children: [
                                        const CustomText(text: 'اختر'),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: AppColor.primary,
                                              border: Border.all(
                                                  color: AppColor.primary),
                                              borderRadius:
                                                  BorderRadius.circular(1000)),
                                          child: IconButton(
                                              onPressed: () {
                                                controller.getDateFromUser(
                                                  context,
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.date_range,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBoxHieght(h: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const CustomText(text: 'ادخل الساعة'),
                                    Column(
                                      children: [
                                        const CustomText(text: 'اختر'),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: AppColor.primary,
                                              border: Border.all(
                                                  color: AppColor.primary),
                                              borderRadius:
                                                  BorderRadius.circular(1000)),
                                          child: IconButton(
                                              onPressed: () {
                                                controller.getTimeFromUser(
                                                  context,
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.access_time_rounded,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBoxHieght(h: 60),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const CustomText(text: 'اختر اللون'),
                                    Wrap(
                                        children: List.generate(
                                      6,
                                      (index) => GestureDetector(
                                        onTap: () {
                                          controller.changecolor(index);
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: CircleAvatar(
                                            backgroundColor: index == 0
                                                ? AppColor.primary
                                                : index == 1
                                                    ? AppColor.pinkClr
                                                    : index == 2
                                                        ? AppColor.bluesky
                                                        : index == 3
                                                            ? AppColor.pinky
                                                            : index == 4
                                                                ? AppColor
                                                                    .pinkdark
                                                                : AppColor
                                                                    .orangeClr,
                                            radius: 14,
                                            child: controller.selectedColor ==
                                                    index
                                                ? const Icon(
                                                    Icons.done_rounded,
                                                    color: Colors.white,
                                                    size: 16,
                                                  )
                                                : null,
                                          ),
                                        ),
                                      ),
                                    )),
                                  ],
                                ),
                                const SizedBoxHieght(h: 60),
                                SizedBox(
                                    width: double.infinity,
                                    child: CustomButtonQuiz(
                                        text: 'أضف',
                                        onPressed: () {
                                          if (controller.formKey.currentState!
                                              .validate()) {
                                            controller.addtodatapase();
                                          } else {
                                            Get.snackbar('الرجاء ملئ الحقول',
                                                'هنالك بعض الحقول الفارقة قم بتعبئتها',
                                                backgroundColor: Colors.red,
                                                titleText: const Directionality(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    child: Text(
                                                      'الرجاء ملئ الحقول',
                                                      style: TextStyle(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                                messageText:
                                                    const Directionality(
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        child: Text(
                                                          'هنالك بعض الحقول الفارقة قم بتعبئتها',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color:
                                                                  Colors.white),
                                                        )),
                                                colorText: Colors.white);
                                          }
                                        })),
                              ]),
                            ),
                          ),
                          controller.isAdLoaded
                              ? SizedBox(
                                  height: controller.bannerAd.size.height
                                      .toDouble(),
                                  width:
                                      controller.bannerAd.size.width.toDouble(),
                                  child: AdWidget(ad: controller.bannerAd),
                                )
                              : const SizedBox(
                                  child: Text(''),
                                ),
                        ],
                      ),
                    ),
                  ))),
        ));
  }
}
