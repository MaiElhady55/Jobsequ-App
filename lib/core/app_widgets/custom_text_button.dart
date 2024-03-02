import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final void Function() function;
  final String title;
  final TextStyle textStyle;

  const CustomTextButton(
      {super.key,
      required this.function,
      required this.title,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function,
        child: Text(
          title,
          style: textStyle,
        ));
  }
}
