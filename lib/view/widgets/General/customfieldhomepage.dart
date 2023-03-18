import 'package:flutter/material.dart';

import '../../../component/constant/colors.dart';

class CustomFieldHomePage extends StatelessWidget {
  final TextEditingController controller;
  final int? text;
  final String? hint;

  const CustomFieldHomePage(
      {Key? key, required this.controller, this.hint, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: text == null ? TextInputType.number : TextInputType.text,

      cursorColor: AppColor.primary,
      cursorHeight: 30,
      decoration: InputDecoration(
        hintText: hint,
        labelStyle: const TextStyle(
          color: AppColor.primary,
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
