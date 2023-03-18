import 'package:flutter/material.dart';
import 'package:yourguide/component/constant/colors.dart';

class CustomMarksText extends StatelessWidget {
  const CustomMarksText({
    Key? key,
    required this.text,
    required this.size,
  }) : super(key: key);
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Cairo',
        color: AppColor.textColor2,
      ),
    );
  }
}
