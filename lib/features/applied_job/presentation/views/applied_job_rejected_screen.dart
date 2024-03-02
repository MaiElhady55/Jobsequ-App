import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/app_images.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class AppliedJobRejectedScreen extends StatelessWidget {
  const AppliedJobRejectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.rejectedJob),
            SizedBox(height: 3.h,),
            Text(
              'No applications were rejected',
              textAlign: TextAlign.center,
              style: Styles.textStyle20.copyWith(color: AppTheme.neutral9,)
            ),
            SizedBox(height: 1.h,),
            Text(
              'If there is an application that is rejected by the company it will appear here',
              textAlign: TextAlign.center,
              style: Styles.textStyle13.copyWith(color: AppTheme.neutral5,)
            )
          ],
        ),
      ),
    );
  }
}