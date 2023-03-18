import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yourguide/controller/basic/homepagecontroller.dart';

import '../Text/customtext.dart';

class BodyRowLetters extends StatelessWidget {
  final String text;
  final String hint;
  final String letters;
  final void Function(int?)? onChanged;
  final void Function(String?)? onChanged2;
  final int value;
  const BodyRowLetters(
      {Key? key,
      required this.text,
      required this.letters,
      required this.hint,
      required this.onChanged,
      required this.onChanged2,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 100,
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              child: GetBuilder<HomePageControllerImpl>(
                builder: (controller) => DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    dropdownPadding: const EdgeInsets.symmetric(horizontal: 10),
                    hint: Text(
                      '',
                      style: TextStyle(
                        fontSize: 10,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: [
                      'أ',
                      'أ-',
                      'ب+',
                      'ب',
                      'ب-',
                      'ج+',
                      'ج',
                      'ج-',
                      'د+',
                      'د',
                      'د-',
                      'ه'
                    ]
                        .map((item) => DropdownMenuItem<String>(
                              alignment: Alignment.center,
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: letters,
                    onChanged: onChanged2,
                    buttonHeight: 40,
                    buttonWidth: 90,
                    itemHeight: 40,
                  ),
                ),
              ),
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
                              alignment: Alignment.center,
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
