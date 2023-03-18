// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../component/constant/colors.dart';

class CustomRowProfile extends StatelessWidget {
  final IconData icon;
  final String title;
  const CustomRowProfile({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColor.primary,
          size: 30,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 18.0, fontFamily: 'Cairo'),
        ),
      ],
    );
  }
}
