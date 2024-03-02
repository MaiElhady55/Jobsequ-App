import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class CustomSocialButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final String image;

  const CustomSocialButton(
      {required this.image,
      required this.onPressed,
      required this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: const BorderSide(
          color: AppTheme.neutral3,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(
              width: 1.w,
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Text(text, style: Styles.textStyle14W500),
            ),
          ],
        ),
      ),
    );
  }
}
