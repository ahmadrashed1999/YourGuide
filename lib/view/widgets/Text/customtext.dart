import 'package:flutter/material.dart';

import '../../../component/constant/colors.dart';

class CustomText extends StatelessWidget {
  final String text;

  const CustomText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          fontSize: 12,
          color: AppColor.textColor2,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ));

    // style: style,
  }
}

class CustomTextCard extends StatelessWidget {
  final String text;

  const CustomTextCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          fontSize: 12,
          color: AppColor.textColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ));

    // style: style,
  }
}
