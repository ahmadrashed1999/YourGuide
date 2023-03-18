import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yourguide/controller/markscontrollers/convertletterscontroller.dart';
import 'package:yourguide/view/widgets/Appbar/appbartext.dart';
import 'package:yourguide/view/widgets/SizedBox/SizedBoxhieght.dart';

import 'package:yourguide/view/widgets/General/customfieldhomepage.dart';
import 'package:yourguide/view/widgets/marks/custommarkstext.dart';

import '../../../component/constant/colors.dart';

class ConverterLetersPage extends StatelessWidget {
  const ConverterLetersPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ConverterLetersPageControllerImpl controller =
        Get.put(ConverterLetersPageControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText(text: 'تحويل'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.primary,
      ),
      body: GetBuilder<ConverterLetersPageControllerImpl>(
        builder: (controller) => Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomMarksText(
                      text: 'الرجاء ادخال الأحرف كما هي في العلامة', size: 16),
                  CustomFieldHomePage(
                    text: 1,
                    hint: 'أدخل علامتك بالأحرف',
                    controller: controller.controller,
                  ),
                  const SizedBoxHieght(h: 20),
                  controller.isAdLoaded
                      ? SizedBox(
                          height: controller.bannerAd.size.height.toDouble(),
                          width: controller.bannerAd.size.width.toDouble(),
                          child: AdWidget(ad: controller.bannerAd),
                        )
                      : const SizedBox(),
                  GestureDetector(
                    onTap: () {
                      controller.convert();
                      Get.defaultDialog(
                        contentPadding: const EdgeInsets.all(20),
                        title: 'النتيجة',
                        titleStyle: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Cairo',
                          color: AppColor.textColor,
                        ),
                        content: Column(
                          children: [
                            CustomMarksText(
                              text:
                                  'العلامة المؤية المراد تحويلها هي:${controller.result.toStringAsFixed(2)}',
                              size: 12,
                            ),
                            CustomMarksText(
                              text:
                                  'العلامة من 4 المراد تحويلها هي:${controller.l.toStringAsFixed(2)}',
                              size: 12,
                            ),
                          ],
                        ),
                      );
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
                          'تحويل',
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
              )),
            ),
          ),
        ),
      ),
    );
  }
}
