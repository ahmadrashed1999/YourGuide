import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yourguide/component/constant/links.dart';
import 'package:yourguide/main.dart';

import '../../core/classes/curd.dart';
import '../../view/screens/baseicScreen/homescreen.dart';

abstract class VerfiyCodeSignUpPage extends GetxController {}

class VerfiyCodeSignUpPageImp extends VerfiyCodeSignUpPage {
  bool isLoading = false;
  String code = '';
  final formKey = GlobalKey<FormState>();
  final codecontroller = TextEditingController();
  void VerfiyCode(email) async {
    isLoading = !isLoading;
    update();
    await Future.delayed(Duration(seconds: 2));
    Curd c = Curd();
    var response =
        await c.postrequest(verificationcode, {'v_code': code, 'email': email});
    print(response);
    if (int.parse(response) == 1) {
      isLoading = !isLoading;
      update();
      prefs.setBool('isUser', true);
      Get.snackbar(
        'تم التسجيل بنجاح',
        'تم تفعيل حسابك بنجاح',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.to(const HomeScreen());
    }
  }

  @override
  void onInit() {}
}
