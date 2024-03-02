import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  // final String lableText;
  final String? hintText;
  final Widget? prifix;
  final TextInputType type;
  final bool? obscureText;
  final VoidCallback? suffixFun;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? errorColor;
  final AutovalidateMode? autoValidateMode;
  final String? errorText;
  final TextInputAction? textInputAction;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      //required this.lableText,
      this.hintText,
      this.textInputAction,
       this.prifix,
      required this.type,
       this.validator,
      this.obscureText = false,
      this.suffixIcon = null,
      this.suffixFun = null,
      this.onTap,
      this.prefixIconColor,
      this.suffixIconColor,
      this.errorColor,
      this.autoValidateMode,
      this.errorText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(decoration: TextDecoration.none),
      validator: validator,
      controller: controller,
      autocorrect: false,
      textInputAction: textInputAction,
      onTap: onTap,
      keyboardType: type,
      obscureText: obscureText!,
      decoration: InputDecoration(
        prefixIcon: prifix,
        prefixIconColor: prefixIconColor,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        hintText: hintText,
        hintStyle: Styles.textStyle14,
        errorText: errorText,
        errorStyle: TextStyle(
          color: errorColor,
          fontSize: 16,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primary5),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(),
        // labelText: lableText,
        // labelStyle: Styles.textStyle14,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppTheme.neutral3,
          ),
        ),
      ),
    );
  }
}
