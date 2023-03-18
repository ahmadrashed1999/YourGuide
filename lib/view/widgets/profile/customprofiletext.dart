import 'package:flutter/material.dart';

import '../../../component/constant/colors.dart';

class CustomProfileText extends StatelessWidget {
  final String text;
  final double? size;

  const CustomProfileText({Key? key, required this.text, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: size ?? 18,
          color: AppColor.textColor2,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ));

    // style: style,
  }
}
