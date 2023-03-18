import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yourguide/view/screens/baseicScreen/formsscreens.dart';

abstract class QuizPageController extends GetxController {
  gotocompage();
  gotoenglish();
  gotoarabic();
}

class QuizPageControllerImpl extends QuizPageController {
  late BannerAd bannerAd;
  bool isAdLoaded = false;
  void initBannerAd() async {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-2902051447809378/7384351175',
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

  List<String> com = [
    'https://forms.gle/bwk5mWbom4RLp8JX6',
    'https://forms.gle/9veLrYzLQRiZR5QZ7',
    'https://forms.gle/MBJtSkTdSjZRsr5x9',
    'https://forms.gle/zsQ6rRhVDzAHiKAt8',
    'https://forms.gle/o9Cmt8T28edTpXn79',
    'https://forms.gle/otn4TZ7Z5JzHym6q6'
  ];
  List<String> arab = [
    'https://forms.gle/D8ommTMoGgbPiF2ZA',
    'https://forms.gle/z1oBkoJiLK9EW8rr7',
    'https://forms.gle/hSqdnry1P1uaZf7S7',
    'https://forms.gle/ZRiLCSaJnXcwyswj8',
    'https://forms.gle/6ciYzuHmyS4z6M9o8',
    'https://forms.gle/Cc7hYAibX4MUmK9W6',
    'https://forms.gle/vVRNCPTJk3qMeGpu6',
    'https://forms.gle/nxuxrtaeiHoGu9WB8',
  ];
  List<String> engi = [
    'https://forms.gle/dtt5xdjvYyUA7jGY6',
    'https://forms.gle/B427sHE8aGESCzry9',
    'https://forms.gle/RH2oDexqSPf543z7A',
    'https://forms.gle/NtZWRvA5znq2MV998',
    'https://forms.gle/teKkTY1ungZ4kFsa6',
    'https://forms.gle/M1rZcU1Ft3um7TCk6',
    'https://forms.gle/5Qe7mwzkC24ZSUa36'
  ];
  @override
  gotocompage() {
    Get.to(FormsScreen(title: "حاسوب استدراكي", items: com));
    update();
  }

  @override
  gotoenglish() {
    Get.to(FormsScreen(title: "إنجليزي استدراكي", items: engi));
    update();
  }

  @override
  gotoarabic() {
    Get.to(FormsScreen(title: "عربي استدراكي", items: arab));
    update();
  }

  @override
  void onInit() {
    // initBannerAd();
    super.onInit();
  }
}
