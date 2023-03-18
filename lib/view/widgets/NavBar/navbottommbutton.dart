import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final Function()? onTap;
  final Color? color;
  final String text;
  const NavButton({Key? key, this.onTap, this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: 55,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Cairo',
            ),
          ),
        ),
      ),
    );
  }
}
