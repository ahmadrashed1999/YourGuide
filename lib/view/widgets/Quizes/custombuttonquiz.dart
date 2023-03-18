import 'package:flutter/material.dart';
import 'package:yourguide/component/constant/colors.dart';

class CustomButtonQuiz extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? color;
  const CustomButtonQuiz(
      {Key? key, required this.text, required this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 120,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: color ?? AppColor.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColor.textColor,
              fontSize: 14,
              fontFamily: 'Cairo',
            ),
          ),
        ),
      ),
    );
  }
}
