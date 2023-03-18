import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:yourguide/controller/usercontroller/verfiycodepagecontroller.dart';
import 'package:yourguide/core/classes/curd.dart';
import 'package:yourguide/view/screens/baseicScreen/homescreen.dart';
import '../../../component/constant/colors.dart';

class VerfiyCodeSignUpPage extends StatelessWidget {
  VerfiyCodeSignUpPage({Key? key, required this.email}) : super(key: key);
  final String email;
  VerfiyCodeSignUpPageImp co = Get.put(VerfiyCodeSignUpPageImp());
  @override
  Widget build(BuildContext context) {
    // VerfiyCodeSignUpControllerImpl _controller =
    //     Get.put(VerfiyCodeSignUpControllerImpl());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        title: const Text('رمز التحقق',
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
      body: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          child: Center(child:
              GetBuilder<VerfiyCodeSignUpPageImp>(builder: ((controller) {
            return ListView(children: [
              const SizedBox(height: 30),
              Lottie.network(
                'https://assets6.lottiefiles.com/packages/lf20_o7vsrokz.json',
                width: 250,
                height: 250,
              ),
              const SizedBox(height: 30),
              OtpTextField(
                numberOfFields: 5,
                fieldWidth: 50,

                borderColor: AppColor.primary,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  controller.code = '${controller.code}$code';
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) async {}, // end onSubmit
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'أدخل الرمز الذي أرسل الى بريدك',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: AppColor.textColor2,
                  fontFamily: 'Cairo',
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primary,
                      ),
                    )
                  : SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.VerfiyCode(email);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'تحقق',
                          style: TextStyle(
                            color: AppColor.textColor,
                            fontFamily: 'Cairo',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
            ]);
          })))),
    );
  }
}
