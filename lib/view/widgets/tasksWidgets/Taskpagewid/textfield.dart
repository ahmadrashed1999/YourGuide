// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../component/constant/colors.dart';
import '../../../../component/methos/validate.dart';

class CustomTaskField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final String hint;

  CustomTaskField(
      {Key? key,
      required this.controller,
      required this.hint,
      required this.text})
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
      decoration: InputDecoration(
        label: Text(text),
        hintText: hint,
        labelStyle: const TextStyle(
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
