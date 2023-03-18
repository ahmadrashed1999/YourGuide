import 'package:flutter/material.dart';

import '../../../component/constant/colors.dart';

class CustomTaskFieldHomePage extends StatelessWidget {
  final TextEditingController controller;
  final int? text;
  final String? hint;

  const CustomTaskFieldHomePage(
      {Key? key, required this.controller, this.hint, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColor.primary,
      cursorHeight: 30,
      decoration: const InputDecoration(
        label: Text('اسم المادة'),
        hintText: 'أدخل اسم المادة',
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
