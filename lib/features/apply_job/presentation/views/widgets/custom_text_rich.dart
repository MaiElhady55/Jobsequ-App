import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';

class CustomTextRich extends StatelessWidget {
  final String title;

  const CustomTextRich({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: title,
              style: Styles.textStyle13.copyWith(
                color: AppTheme.neutral9,
              )),
          TextSpan(
              text: '*',
              style: Styles.textStyle13.copyWith(
                color: AppTheme.danger5,
              )),
        ],
      ),
    );
  }
}
