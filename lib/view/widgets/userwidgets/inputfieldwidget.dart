import 'package:flutter/material.dart';

import '../../../component/constant/colors.dart';
import '../../../component/methos/validate.dart';

class UserInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String label;

  const UserInputWidget(
      {Key? key,
      required this.controller,
      required this.hint,
      required this.label})
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
        label: Text(label),
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
