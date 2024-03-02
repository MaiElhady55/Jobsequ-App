import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';





class SavedJobEmptyScreen extends StatelessWidget {
  const SavedJobEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/home/Saved Ilustration.svg'),
            SizedBox(height: 2.h),
            Text(
              'Nothing has been saved yet',
              textAlign: TextAlign.center,
              style: Styles.textStyle20.copyWith(color:  AppTheme.neutral9,)
            ),
            Text(
              'Press the star icon on the job you want to save.',
              textAlign: TextAlign.center,
              style:Styles.textStyle13.copyWith(color: AppTheme.neutral5,)
            ),
          ],
        ),
      ),
    );

  }
}