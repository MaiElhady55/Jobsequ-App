import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';


class NotificationEmptyScreen extends StatelessWidget {
  const NotificationEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/home/Notification Ilustration.svg'),
           SizedBox(height: 2.h),
           Text(
            'No new notifications yet',
            textAlign: TextAlign.center,
            style:Styles.textStyle20.copyWith(color:  AppTheme.neutral9)
          ),
           Text(
            'You will receive a notification if there is something on your account',
            textAlign: TextAlign.center,
            style: Styles.textStyle13
          ),
        ],
      ),
    );
  }
}