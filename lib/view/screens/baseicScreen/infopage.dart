import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourguide/component/constant/colors.dart';
import 'package:yourguide/controller/infopagecontroller/infppagecontroller.dart';
import 'package:yourguide/view/screens/baseicScreen/homescreen.dart';
import 'package:yourguide/view/widgets/Appbar/appbartext.dart';
import 'package:yourguide/view/widgets/General/dropdwon.dart';
import 'package:yourguide/view/widgets/SizedBox/SizedBoxhieght.dart';
import 'package:yourguide/view/widgets/Text/customtext.dart';

import '../../widgets/Quizes/custombuttonquiz.dart';
import '../../widgets/infopage/customformfield.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  InfoPageControllerImpl c = Get.put(InfoPageControllerImpl());

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoPageControllerImpl>(
        builder: ((controller) => Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: AppColor.primary,
                    title: const AppBarText(
                      text: 'التسجيل',
                    ),
                    centerTitle: true,
                  ),
                  body: controller.isloading
                      ? const Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                    height: 100,
                                    child: CustomText(
                                        text: 'سجل معلوماتك الجامعية ')),
                                Form(
                                  key: controller.formKey,
                                  child: CustomInfoFieldHomePage(
                                    controller: controller.controller,
                                  ),
                                ),
                                const SizedBoxHieght(h: 20),
                                DropDownMenu(
                                  list: controller.unitype,
                                  value: controller.uni_type_name,
                                  onchange: controller.onchangeDropDown,
                                ),
                                const SizedBoxHieght(h: 20),
                                DropDownMenu(
                                  list: controller.isPrivate
                                      ? controller.private_university
                                      : controller.university,
                                  value: controller.isPrivate
                                      ? controller.private_uniname
                                      : controller.uniname,
                                  onchange: controller.isPrivate
                                      ? controller.onchangeDropDown3
                                      : controller.onchangeDropDown2,
                                ),
                                const SizedBoxHieght(h: 20),
                                DropDownMenu(
                                  list: controller.specialty,
                                  value: controller.specialty_name,
                                  onchange: controller.onchangeDropDown4,
                                ),
                                const SizedBoxHieght(h: 20),
                                SizedBox(
                                  width: double.infinity,
                                  child: controller.isloading
                                      ? const CircularProgressIndicator(
                                          color: AppColor.primary,
                                        )
                                      : CustomButtonQuiz(
                                          onPressed: () {
                                            if (controller.formKey.currentState!
                                                .validate()) {
                                              controller.register();
                                              Get.offAll(
                                                  () => const HomeScreen());
                                            } else {
                                              Get.snackbar('الرجاء ملئ الحقول',
                                                  'هنالك بعض الحقول الفارقة قم بتعبئتها',
                                                  backgroundColor: Colors.red,
                                                  titleText:
                                                      const Directionality(
                                                          textDirection:
                                                              TextDirection.rtl,
                                                          child: Text(
                                                            'الرجاء ملئ الحقول',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo',
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          )),
                                                  messageText:
                                                      const Directionality(
                                                          textDirection:
                                                              TextDirection.rtl,
                                                          child: Text(
                                                            'هنالك بعض الحقول الفارقة قم بتعبئتها',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                  colorText: Colors.white);
                                            }

                                            // ignore: avoid_print
                                          },
                                          text: 'تسجيل',
                                        ),
                                )
                              ],
                            ),
                          ),
                        )),
            )));
  }
}
