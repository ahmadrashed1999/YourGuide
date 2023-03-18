import 'package:flutter/material.dart';

import '../../../component/constant/colors.dart';

class CustomNotiFieldHomePage extends StatelessWidget {
  final TextEditingController controller;
  final String? text;
  final String? hint;

  const CustomNotiFieldHomePage(
      {Key? key, required this.controller, this.hint, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColor.primary,
      cursorHeight: 30,
      decoration: InputDecoration(
        label: Text(text!),
        hintText: hint,
        labelStyle: const TextStyle(
          color: AppColor.primary,
          fontFamily: 'Cairo',
        ),
        hintStyle: const TextStyle(
          fontFamily: 'Cairo',
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
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
