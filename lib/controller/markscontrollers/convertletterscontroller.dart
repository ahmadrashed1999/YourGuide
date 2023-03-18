import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

abstract class ConverterLetersPageController extends GetxController {
  convert();
}

class ConverterLetersPageControllerImpl extends ConverterLetersPageController {
  late BannerAd bannerAd;
  bool isAdLoaded = false;
  void initBannerAd() async {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-2902051447809378/3067215103',
        //'// ca-app-pub-9528541724744762/8906857428',
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
  late double l;
  @override
  convert() {
    if (controller.text == "") {
      controller.text = "0";
    }

    switch (controller.text) {
      case 'أ':
        l = 4.0;
        break;
      case 'أ-':
        l = 3.75;
        break;
      case 'ب+':
        l = 3.5;
        break;
      case 'ب':
        l = 3.0;
        break;
      case 'ب-':
        l = 2.75;
        break;
      case 'ج+':
        l = 2.5;
        break;
      case 'ج':
        l = 2.0;
        break;
      case 'ج-':
        l = 1.75;
        break;
      case 'د+':
        l = 1.5;
        break;
      case 'د':
        l = 1.0;
        break;
      case 'د-':
        l = 0.75;
        break;
      case 'ه':
        l = 0;
        break;
      default:
        l = -1;
    }

    result = (l + 1) * 20;
  }

  @override
  void onInit() {
    // initBannerAd();
    super.onInit();
  }
}
