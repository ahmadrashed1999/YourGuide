import 'package:flutter/material.dart';
import 'package:yourguide/controller/addcouretime/addcoursetimecontroller.dart';
import 'package:yourguide/view/widgets/Text/customtext.dart';

import '../../../component/constant/colors.dart';

class TimePickerWid extends StatelessWidget {
  const TimePickerWid({
    Key? key,
    required this.text,
    
    required this.controller, required this.isStartTime,
  }) : super(key: key);
  final String text;
  final AddCourseTimeCotrollerImp controller;
final bool isStartTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(text: text),
        Container(
          decoration: BoxDecoration(
              color: AppColor.primary,
              border: Border.all(color: AppColor.primary),
              borderRadius: BorderRadius.circular(1000)),
          child: IconButton(
              onPressed: () {
                controller.getTimeFromUser(context, isStartTime: isStartTime);
              },
              icon: const Icon(
                Icons.access_time_rounded,
                color: Colors.white,
              )),
        ),
      ],
    );
  }
}
