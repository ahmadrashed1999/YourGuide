import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourguide/view/screens/user/signup.dart';
import 'package:yourguide/view/widgets/Quizes/custombuttonquiz.dart';

import '../../../controller/usercontroller/mainpagecontroller.dart';
import '../../widgets/Text/customtext.dart';
import '../baseicScreen/infopage.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  MainPageControllerImp c = Get.put(MainPageControllerImp());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageControllerImp>(builder: (controller) {
      return controller.isRegister
          ? Center(child: Text('true'))
          : Center(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomText(
                        text:
                            'لم تقم بتسجيل الدخول بعد قم بالتسجيل لتبدأ التواصل '),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButtonQuiz(
                        text: "قم بالتسجيل",
                        onPressed: () {
                          Get.to(() => UserSignUp());
                        }),
                  ],
                ),
              ),
            );
    });
  }
}
