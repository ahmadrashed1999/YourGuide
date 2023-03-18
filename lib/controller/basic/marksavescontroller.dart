import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yourguide/data/database.dart';

abstract class MarkSavesPageController extends GetxController {}

class MarkSavesPageControllerImpl extends MarkSavesPageController {
  late BannerAd bannerAd;
  bool isAdLoaded = false;
  // void initBannerAd() async {
  //   bannerAd = BannerAd(
  //       size: AdSize.banner,
  //       adUnitId: 'ca-app-pub-3940256099942544/6300978111',
  //       //'ca-app-pub-3940256099942544/6300978111',
  //       listener: BannerAdListener(
  //         onAdOpened: (l) {},
  //         onAdLoaded: (loaded) {
  //           isAdLoaded = true;
  //           update();
  //         },
  //         onAdClicked: (c) {},
  //         onAdClosed: (close) {},
  //       ),
  //       request: const AdRequest());
  //   await bannerAd.load();
  // }

  Sql sql = Sql();
  List marks = [];
  bool isEmpty = true;
  Future readData() async {
    List<Map> response = await sql.readData('select * from marks');
    marks.addAll(response);
    if (marks.isNotEmpty) {
    } else {
      isEmpty == false;
      update();
    }
    update();
  }

  updateUi() {
    update();
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    // initBannerAd();
    readData();
    super.onInit();
  }
}
