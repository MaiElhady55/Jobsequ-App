import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';

class CustomRowTitle extends StatelessWidget {
  final String title;
  final void Function() function;

  const CustomRowTitle(
      {super.key, required this.title, required this.function});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Styles.textStyle15),
        TextButton(
            onPressed: function,
            child: Text('View all',
                style: Styles.textStyle11.copyWith(
                  color: AppTheme.primary5,
                ))),
      ],
    );
  }
}
