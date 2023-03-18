import 'package:flutter/material.dart';

class PersonalPhoto extends StatelessWidget {
  const PersonalPhoto({
    Key? key,
    required this.size,
  }) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128.0,
      height: 128.0,
      margin: const EdgeInsets.only(
        top: 24.0,
        bottom: 64.0,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Colors.black26,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.account_circle,
        size: size,
        color: Colors.white,
      ),
    );
  }
}
