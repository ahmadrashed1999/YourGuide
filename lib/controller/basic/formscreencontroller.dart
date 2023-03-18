import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

abstract class FormsPageController extends GetxController {
  // initBannerAd();
}

class FormsPageControllerImpl extends FormsPageController {
  late BannerAd bannerAd;
  bool isAdLoaded = false;
  void initBannerAd() async {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-2902051447809378/3067215103',
        //  ca-app-pub-9528541724744762/8906857428

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

  @override
  void onInit() {
    // initBannerAd();
    super.onInit();
  }
}
