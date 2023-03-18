// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yourguide/controller/markscontrollers/markconvertercontroller.dart';
import 'package:yourguide/view/widgets/Appbar/appbartext.dart';

import 'package:yourguide/view/widgets/General/customfieldhomepage.dart';

import '../../../component/constant/colors.dart';

class ConverterPage extends StatelessWidget {
  const ConverterPage({Key? key}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    ConvertersPageControllerImpl controller =
        Get.put(ConvertersPageControllerImpl());

    return Scaffold(
      appBar: AppBar(
        title: const AppBarText(text: 'تحويل'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.primary,
      ),
      body: GetBuilder<ConvertersPageControllerImpl>(
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
                  CustomFieldHomePage(
                    hint: 'العلامة المئوية المراد تحويلها',
                    controller: controller.controller,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                          color: AppColor.textColor2,
                        ),
                        content: Text(
                          'العلامة من 4 هي:${controller.result.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Cairo',
                            color: AppColor.textColor2,
                          ),
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
