// ignore_for_file: avoid_print, unused_local_variable

import 'package:appinio_animated_toggle_tab/appinio_animated_toggle_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:yourguide/controller/pageprofilecontroller.dart';
import 'package:yourguide/view/screens/Admin/adminpage.dart';

import 'package:yourguide/view/screens/baseicScreen/calculatepage.dart';
import 'package:yourguide/view/screens/baseicScreen/infopage.dart';
import 'package:yourguide/view/screens/baseicScreen/profilepage.dart';
import 'package:yourguide/view/screens/baseicScreen/schedualpage.dart';
import 'package:yourguide/view/screens/baseicScreen/quizesscreen.dart';

import 'package:yourguide/view/screens/marks/fourthgrade.dart';
import 'package:yourguide/view/screens/marks/markconverter.dart';
import 'package:yourguide/view/screens/marks/markconverter2.dart';
import 'package:yourguide/view/screens/marks/markswithletters.dart';
import 'package:yourguide/view/screens/saves/markssaves.dart';
import 'package:yourguide/view/screens/taskspages/taskpage.dart';
import 'package:yourguide/view/widgets/General/customllisttile.dart';
import 'package:yourguide/view/widgets/SizedBox/SizedBoxhieght.dart';

import '../../../component/constant/colors.dart';
import '../../../controller/basic/homepagecontroller.dart';
import '../user/mainpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  ProfilePageController profilePageController =
      Get.put(ProfilePageController());
  List pages = [MainPage(), TaskHomePage(), SchedualPage(), ProfilePage()];

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomePageControllerImpl controller = Get.put(HomePageControllerImpl());
    return GetBuilder<HomePageControllerImpl>(
      builder: (controller) => AdvancedDrawer(
        controller: controller.advancedDrawerController,
        backdropColor: AppColor.backgroundColor,
        drawer: drawer(),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'دليلك الجامعي',
              style: TextStyle(fontFamily: "Cairo"),
            ),
            centerTitle: true,
            backgroundColor: AppColor.primary,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(() => LoginPage());
                  },
                  icon: const Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    Get.to(() => AdminPage());
                  },
                  icon: const Icon(Icons.notification_add)),
            ],
            leading: IconButton(
              onPressed: controller.handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: controller.advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
          ),
          body: Column(children: [
            const SizedBoxHieght(h: 10),
            Expanded(child: pages[currentIndex]),
            const SizedBoxHieght(h: 20),
            profilePageController.isAdLoaded
                ? SizedBox(
                    height:
                        profilePageController.bannerAd.size.height.toDouble(),
                    width: profilePageController.bannerAd.size.width.toDouble(),
                    child: AdWidget(ad: profilePageController.bannerAd),
                  )
                : const SizedBox(
                    child: Text(''),
                  ),
          ]),
          // bottomNavigationBar: controller.bnavBar()
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: currentIndex,
            onTap: (i) => setState(() => currentIndex = i),
            items: [
              /// Home
              bottombutton(Icons.home, 'الرئيسية'),
              bottombutton(Icons.notifications_active_rounded, 'الإشعارات'),
              bottombutton(Icons.task, 'الرئيسية'),
              bottombutton(Icons.person, 'الصفحة الشخصية'),

              /// Search

              /// Profile
            ],
          ),
        ),
      ),
    );
  }

  SalomonBottomBarItem bottombutton(icon, text) {
    return SalomonBottomBarItem(
      icon: Icon(icon),
      title: Text(text,
          style: const TextStyle(
            fontFamily: "Cairo",
            fontSize: 10,
          )),
      selectedColor: AppColor.primary,
    );
  }
}

drawer() {
  return GetBuilder<HomePageControllerImpl>(
    builder: (controller) => Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 64.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.account_circle,
                      size: 128.0,
                      color: Colors.white,
                    ),
                    // child: Lottie.network(
                    //     'https://assets10.lottiefiles.com/packages/lf20_fcecpvzp.json')
                  ),
                  CustomListTile(
                    title: 'الرئيسية',
                    icon: const Icon(Icons.home),
                    onTap: () {
                      controller.handleMenuButtonPressedd();
                    },
                  ),
                  CustomListTile(
                    title: 'حساب المعدل التراكمي',
                    icon: const Icon(Icons.calculate_outlined),
                    onTap: () {
                      Get.to(CalculatePage());
                    },
                  ),
                  CustomListTile(
                    title: 'حساب المعدل بالأحرف',
                    icon: const Icon(Icons.calculate_outlined),
                    onTap: () {
                      Get.to(const MarksWithLetters());
                    },
                  ),
                  CustomListTile(
                    title: 'حساب المعدل من 4',
                    icon: const Icon(Icons.numbers),
                    onTap: () {
                      Get.to(const FourthGrade());
                    },
                  ),
                  CustomListTile(
                    title: 'نماذج إختبارات',
                    icon: const Icon(Icons.quiz),
                    onTap: () {
                      Get.to(const QuizPage());
                    },
                  ),
                  CustomListTile(
                    title: 'المحفوظات',
                    icon: const Icon(Icons.save_sharp),
                    onTap: () {
                      Get.to(const MraksSaves());
                    },
                  ),
                  CustomListTile(
                    title: 'تحويل المعدل الى 4',
                    icon: const Icon(Icons.swap_horiz),
                    onTap: () {
                      Get.to(const ConverterPage());
                    },
                  ),
                  CustomListTile(
                    title: 'تحويل المعدل الى مئوي',
                    icon: const Icon(Icons.swap_horiz),
                    onTap: () {
                      Get.to(const ConverterPage2());
                    },
                  ),
                ],
              ),
            ),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white54,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: const Text('Sync-Fast'),
              ),
            ),
          ],
        ),
      )),
    ),
  );
}
