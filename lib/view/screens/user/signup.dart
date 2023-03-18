import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yourguide/component/constant/colors.dart';

import 'package:yourguide/view/widgets/Quizes/custombuttonquiz.dart';
import 'package:yourguide/view/widgets/SizedBox/SizedBoxhieght.dart';

import '../../../controller/usercontroller/signuppagecontroller.dart';

import '../../widgets/userwidgets/inputfieldwidget.dart';

class UserSignUp extends StatelessWidget {
  UserSignUp({Key? key}) : super(key: key);

  SignUpControllerImp controllerImp = Get.put(SignUpControllerImp());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primary,
            elevation: 0,
            title: const Text('تسجيل',
                style: TextStyle(
                  color: AppColor.textColor,
                  fontFamily: 'Cairo',
                  fontSize: 20,
                )),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.textColor,
              ),
              onPressed: () => Get.back(),
            ),
          ),
          body: GetBuilder<SignUpControllerImp>(
            builder: (controller) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    const SizedBoxHieght(h: 30),
                    LottieBuilder.network(
                      'https://assets4.lottiefiles.com/packages/lf20_mzheZcRzLW.json',
                      width: 250,
                      height: 250,
                    ),
                    UserInputWidget(
                      controller: controller.namecontroller,
                      hint: 'أدخل اسم المستخدم',
                      label: 'اسم المستخدم',
                    ),
                    const SizedBoxHieght(h: 30),
                    UserInputWidget(
                      controller: controller.emailcontroller,
                      hint: 'أدخل البريد الإلكتروني ',
                      label: 'البريد الإلكتروني',
                    ),
                    const SizedBoxHieght(h: 30),
                    UserInputWidget(
                      controller: controller.passwordcontroller,
                      hint: 'أدخل كلمة المرور',
                      label: 'كلمة المرور',
                    ),
                    const SizedBoxHieght(h: 30),
                    controller.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: AppColor.primary,
                          ))
                        : CustomButtonQuiz(
                            text: 'تسجيل',
                            onPressed: () {
                              controller.register();
                            })
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
