import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yourguide/data/database.dart';

class ProfilePageController extends GetxController {
  late BannerAd bannerAd;
  bool isAdLoaded = false;
  void initBannerAd() async {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-2902051447809378/8098667049',
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

  Sql sql = Sql();
  final List<DateTime> toHighlight = [];

  Future<void> fetchTasks() async {
    List<Map> taskMaps = await sql.read('tasks');
    for (var element in taskMaps) {
      toHighlight.add(DateTime.parse(element['time']));
    }

    update();
  }

  @override
  void onInit() {
    // initBannerAd();
    super.onInit();
  }
}
