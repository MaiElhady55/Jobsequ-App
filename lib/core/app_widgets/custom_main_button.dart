import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';

class CustomMainButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final String text;
  final bool isLoading;
  final Color buttonColor;
  final double fontSize;

  const CustomMainButton(
      {super.key,
      required this.onPressed,
      this.width = double.infinity,
      this.height = 50,
      required this.text,
      this.fontSize = 16,
      this.buttonColor = AppTheme.primary5,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1000), // <-- Radius
            ),
          ),
          child: isLoading
              ? const SpinKitThreeInOut(
                  color: Colors.white,
                  size: 25,
                )
              : Center(
                  child: Text(
                      textAlign: TextAlign.center,
                      text,
                      style: Styles.textStyle16.copyWith(fontSize: fontSize)))),
    );
  }
}
