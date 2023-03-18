import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:yourguide/component/constant/colors.dart';

class DropDownMenu extends StatelessWidget {
  const DropDownMenu({
    Key? key,
    required this.list,
    required this.value,
    required this.onchange,
  }) : super(key: key);

  final List<String> list;
  // ignore: prefer_typing_uninitialized_variables
  final value;
  // ignore: prefer_typing_uninitialized_variables
  final void Function(String?)? onchange;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonHideUnderline(
          child: ListView(
            children: [
              DropdownButton2<String>(
                dropdownFullScreen: true,
                isExpanded: true,
                items: list
                    .map((item) => DropdownMenuItem<String>(
                          alignment: Alignment.centerRight,
                          value: item,
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                                color: AppColor.primary,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                        ))
                    .toList(),
                value: value,
                onChanged: onchange,
                itemHeight: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
