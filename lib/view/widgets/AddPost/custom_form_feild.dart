import 'package:flutter/material.dart';

import '../../../component/constant/colors.dart';

class CustomPostFieldPage extends StatelessWidget {
  final TextEditingController controller;
  final int? text;
  final String? hint;

  const CustomPostFieldPage(
      {Key? key, required this.controller, this.hint, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 4,
      controller: controller,
      cursorColor: AppColor.primary,
      cursorHeight: 30,
      decoration: const InputDecoration(
        hintText: 'اكتب ما تريد...',
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
