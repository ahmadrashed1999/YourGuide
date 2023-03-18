// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:yourguide/component/constant/colors.dart';

import '../../../controller/basic/formscreencontroller.dart';
import '../../widgets/Quizes/custombuttonquiz.dart';

class FormsScreen extends StatelessWidget {
  final String title;
  final List<String> items;
  FormsScreen({Key? key, required this.title, required this.items})
      : super(key: key);
  FormsPageControllerImpl controller = Get.put(FormsPageControllerImpl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
            style: const TextStyle(color: Colors.white, fontFamily: 'Cairo')),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.primary,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.black,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CustomButtonQuiz(
                      text: 'نموذج : ${index + 1}',
                      onPressed: () async {
                        await llaunchUrl(items[index]);
                        //Get.to(WebViewExample());
                      });
                },
              ),
            ),
            controller.isAdLoaded
                ? SizedBox(
                    height: controller.bannerAd.size.height.toDouble(),
                    width: controller.bannerAd.size.width.toDouble(),
                    child: AdWidget(ad: controller.bannerAd),
                  )
                : const SizedBox(
                 
                  ),
          ],
        ),
      ),
    );
  }

  Future<void> llaunchUrl(url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
