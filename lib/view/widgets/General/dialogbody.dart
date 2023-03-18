import 'package:flutter/material.dart';

class DialogBody extends StatelessWidget {
  const DialogBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          // ignore: prefer_const_constructors
          child: Text(
            'هل ترغب بإضافة مادة جديدة ام التوجه للصفحة الرئيسية؟',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, fontStyle: FontStyle.italic, fontFamily: 'Cairo'),
          ),
        ),
      ),
    );
  }
}
