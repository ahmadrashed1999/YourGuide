import 'package:flutter/material.dart';

import '../../../component/constant/colors.dart';
import '../../../component/methos/validate.dart';

class CustomInfoFieldHomePage extends StatelessWidget {
  final TextEditingController controller;
  final int? text;
  final String? hint;

  const CustomInfoFieldHomePage(
      {Key? key, required this.controller, this.hint, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validateInput(value!);
      },
      controller: controller,
      cursorColor: AppColor.primary,
      cursorHeight: 30,
      decoration: const InputDecoration(
        label: Text('الأسم الكامل'),
        hintText: 'أدخل اسمك الكامل',
        labelStyle: TextStyle(
          color: AppColor.primary,
          fontFamily: 'Cairo',
        ),
        hintStyle: TextStyle(
          fontFamily: 'Cairo',
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      // controller: gpaCont,
      onChanged: (data) {
        // gpar = double.tryParse(gpaCont.text);
      },
      //decoration: buildInputDecoration(),
    );
  }
}
