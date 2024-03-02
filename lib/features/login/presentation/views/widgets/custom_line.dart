import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';

class CustomLine extends StatelessWidget {
  const CustomLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: AppTheme.neutral3,
          ),
        ),
      ),
    );
  }
}
