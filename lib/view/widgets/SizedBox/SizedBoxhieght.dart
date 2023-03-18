// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SizedBoxHieght extends StatelessWidget {
  const SizedBoxHieght({
    Key? key,
    required this.h,
  }) : super(key: key);
  final double h;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: h,
    );
  }
}
