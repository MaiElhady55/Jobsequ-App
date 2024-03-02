import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

abstract class Styles {
  static TextStyle textStyle27 = TextStyle(
    fontSize: 27.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'SFProDisplay',
    color: AppTheme.neutral9,
  );

  static TextStyle textStyle13 = TextStyle(
    fontSize: 13.5.sp,
    fontWeight: FontWeight.w400,
    color: AppTheme.neutral5,
  );

  static TextStyle textStyle16 = TextStyle(
    color: Colors.white,
    fontSize: 16,
     fontFamily: 'SFProDisplay',
    fontWeight: FontWeight.w500,
  );
  

  static TextStyle textStyle16W = TextStyle(
    color: AppTheme.neutral9,
    fontSize: 16,
    fontFamily: 'SFProDisplay',
  );

  static TextStyle textStyle28 = TextStyle(
    color: AppTheme.neutral9,
    fontSize: 28,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textStyle16W400 = TextStyle(
    color: AppTheme.neutral5,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppTheme.neutral4,
  );

  static TextStyle textStyle14W500 = TextStyle(
    color: Color(0xFF363F5E),
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyle20 = TextStyle(
    color: AppTheme.neutral9,
    fontSize: 20.sp,
    fontFamily: 'SFProDisplay',
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyle11 = TextStyle(
    fontSize: 11.5.sp,
    fontFamily: 'SFProDisplay',
    fontWeight: FontWeight.w500,
  );
  static TextStyle textStyle12 = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'SFProDisplay',
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyle24 = TextStyle(
    color: AppTheme.neutral9,
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyle9 = TextStyle(
    color: AppTheme.primary5,
    fontSize: 9.sp,
    fontFamily: 'SFProDisplay',
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyle10({Color color = AppTheme.neutral7}) => TextStyle(
        color: color,
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
      );

  static TextStyle textStyle19 = TextStyle(
    overflow: TextOverflow.ellipsis,
    fontSize: 19.sp,
    color: AppTheme.neutral9,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textStyle15 = TextStyle(
    color: AppTheme.neutral9,
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
  );
}
