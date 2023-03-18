import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: 'Cairo',
      ),
    );
  }
}
