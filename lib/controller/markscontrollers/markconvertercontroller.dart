import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

abstract class ConverterPageController extends GetxController {
  convert();
}

class ConvertersPageControllerImpl extends ConverterPageController {
  late BannerAd bannerAd;
  bool isAdLoaded = false;
  void initBannerAd() async {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-2902051447809378/3067215103',
        //'ca-app-pub-9528541724744762/8906857428',
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

  late TextEditingController controller = TextEditingController();
  late double result = 0.0;
  @override
  convert() {
    if (controller.text == "") {
      controller.text = "0";
    }
    // print(double.tryParse(controller.text)! / 20);
    result = (double.tryParse(controller.text))! / 25;
  }

  @override
  void onInit() {
    // initBannerAd();
    super.onInit();
  }
}
