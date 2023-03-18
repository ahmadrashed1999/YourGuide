import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function()? onTap;
 final Color a = Colors.white;
  const CustomListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
          )),
    );
  }
}
