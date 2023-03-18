import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yourguide/controller/basic/quizpagecontroller.dart';

import 'package:yourguide/view/widgets/Quizes/custombuttonquiz.dart';

import '../../../component/constant/colors.dart';
import '../../widgets/Appbar/appbartext.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizPageControllerImpl quizPageController =
        Get.put(QuizPageControllerImpl());
    //final nodes = <TreeNode>[];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: const AppBarText(text: 'نماذج إختبارات'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Expanded(
              child: ListView(shrinkWrap: true, children: [
                const SizedBox(height: 10),
                CustomButtonQuiz(
                    text: 'نماذج حاسوب إستدراكي ',
                    onPressed: () {
                      quizPageController.gotocompage();
                    }),
                const SizedBox(height: 10),
                CustomButtonQuiz(
                    text: 'نماذج إنجليزي إستدراكي ',
                    onPressed: () {
                      quizPageController.gotoenglish();
                    }),
                const SizedBox(height: 10),
                CustomButtonQuiz(
                    text: 'نماذج عربي إستدراكي ',
                    onPressed: () {
                      quizPageController.gotoarabic();
                    }),
                const SizedBox(height: 10),
              ]),
            ),
            quizPageController.isAdLoaded
                ? SizedBox(
                    height: quizPageController.bannerAd.size.height.toDouble(),
                    width: quizPageController.bannerAd.size.width.toDouble(),
                    child: AdWidget(ad: quizPageController.bannerAd),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
