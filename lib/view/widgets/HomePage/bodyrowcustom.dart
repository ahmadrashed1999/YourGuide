import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yourguide/controller/basic/homepagecontroller.dart';

import '../Text/customtext.dart';
import '../General/customfieldhomepage.dart';

class BodyRow extends StatelessWidget {
  final String text;
  final String hint;
  final TextEditingController controller;
  final void Function(int?)? onChanged;
  final int value;
  const BodyRow(
      {Key? key,
      required this.text,
      required this.controller,
      required this.hint,
      required this.onChanged,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            height: 50,
            child: CustomFieldHomePage(
              controller: controller,
            ),
          ),
          SizedBox(
            width: 120,
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              child: GetBuilder<HomePageControllerImpl>(
                builder: (controller) => DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: [0, 1, 2, 3]
                        .map((item) => DropdownMenuItem<int>(
                              value: item,
                              child: Text(
                                "$item",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: value,
                    onChanged: onChanged,
                    buttonHeight: 40,
                    buttonWidth: 90,
                    itemHeight: 40,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 110, child: CustomText(text: ": المادة$text ")),
        ],
      ),
    );
  }
}
