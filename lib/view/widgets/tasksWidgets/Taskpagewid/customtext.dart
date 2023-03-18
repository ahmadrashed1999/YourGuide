import 'package:flutter/material.dart';

import '../../../../component/constant/colors.dart';

class CustomTextTask extends StatelessWidget {
  final String text;

  const CustomTextTask({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          fontSize: 18,
          color: AppColor.textColor2,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ));

    // style: style,
  }
}
