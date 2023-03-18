// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yourguide/component/constant/colors.dart';
import 'package:yourguide/controller/addcouretime/addcoursetimecontroller.dart';
import 'package:yourguide/view/widgets/Appbar/appbartext.dart';
import 'package:yourguide/view/widgets/Quizes/custombuttonquiz.dart';
import 'package:yourguide/view/widgets/SizedBox/SizedBoxhieght.dart';
import 'package:yourguide/view/widgets/Text/customtext.dart';
import 'package:yourguide/view/widgets/tasksWidgets/customformfield.dart';

import '../../widgets/tasksWidgets/timepickerwid.dart';

// ignore: must_be_immutable
class AddCourseTime extends StatelessWidget {
  AddCourseTimeCotrollerImp c = Get.put(AddCourseTimeCotrollerImp());
  AddCourseTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCourseTimeCotrollerImp>(
      builder: (controller) => Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: const AppBarText(
                text: 'إضافة مواعيد المواد',
              ),
              backgroundColor: AppColor.primary,
              elevation: 0,
              centerTitle: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(text: 'الرجاء ادخال معلومات المادة'),
                const SizedBoxHieght(h: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 200,
                        child: CustomTaskFieldHomePage(
                            controller: controller.textController)),

                    TimePickerWid(
                        text: 'من', controller: controller, isStartTime: true),
                    TimePickerWid(
                        text: 'إلى',
                        controller: controller,
                        isStartTime: false),

                    // const DatePickerWid(),
                  ],
                ),
                const SizedBoxHieght(h: 15),
                const CustomText(text: 'الرجاء اختيار ايام المادة'),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  // DropDownMultiSelect comes from multiselect
                  child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: MultiSelectContainer(
                          itemsDecoration: MultiSelectDecorations(
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.primary),
                                borderRadius: BorderRadius.circular(20)),
                            selectedDecoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  AppColor.primary,
                                  AppColor.primary,
                                ]),
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(5)),
                            disabledDecoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(color: Colors.grey[500]!),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          items: [
                            MultiSelectCard(value: 'الأحد', label: 'الأحد'),
                            MultiSelectCard(value: 'الإثنين', label: 'الإثنين'),
                            MultiSelectCard(
                              value: 'الثلاثاء',
                              label: 'الثلاثاء',
                            ),
                            MultiSelectCard(
                                value: 'الاربعاء', label: 'الاربعاء'),
                            MultiSelectCard(value: 'الخميس', label: 'الخميس'),
                          ],
                          onChange: (allSelectedItems, selectedItem) {
                            controller.selected = allSelectedItems;
                            controller.update();
                          })),
                ),
                const SizedBoxHieght(h: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          padding: const EdgeInsets.only(right: 8),
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
                                                ? AppColor.pinkdark
                                                : AppColor.orangeClr,
                            radius: 14,
                            child: controller.selectedColor == index
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
                const SizedBoxHieght(h: 40),
                SizedBox(
                    width: 250,
                    child: CustomButtonQuiz(
                        text: 'حفظ',
                        onPressed: () {
                          controller.addToDataBase(context);
                        })),
                const Spacer(),
                c.isAdLoaded
                    ? SizedBox(
                        height: c.bannerAd.size.height.toDouble(),
                        width: c.bannerAd.size.width.toDouble(),
                        child: AdWidget(ad: c.bannerAd),
                      )
                    : const SizedBox(
                        child: Text(''),
                      ),
              ],
            )),
      ),
    );
  }
}
