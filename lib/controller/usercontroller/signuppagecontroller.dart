import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourguide/core/classes/curd.dart';
import 'package:yourguide/main.dart';
import 'package:yourguide/view/screens/user/verfiycodepage.dart';

import '../../component/constant/links.dart';

abstract class SignUpController extends GetxController {}

class SignUpControllerImp extends SignUpController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  void register() async {
    Curd curd = Curd();

    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();
      var response = await curd.postrequest(linkSingUp, {
        'username': namecontroller.text,
        'email': emailcontroller.text,
        'password': passwordcontroller.text,
      });
      isLoading = false;
      update();
      print(response);

      if (int.parse(response) == 1) {
        Get.snackbar(
          'تم التسجيل بنجاح',
          'تم ارسال رمز التفعيل الى بريدك الالكتروني',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.to(() => VerfiyCodeSignUpPage(
              email: emailcontroller.text,
            ));
      }
    }
  }

  @override
  void onInit() {}

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    namecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }
}
