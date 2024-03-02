import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class AppliedScreenNotFound extends StatelessWidget {
  const AppliedScreenNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/home/Search Ilustration.svg"),
            SizedBox(
              height: 3.h,
            ),
            Text('Nothing has been applied yet',
                textAlign: TextAlign.center,
                style: Styles.textStyle20.copyWith(
                  color: AppTheme.neutral9,
                )),
            SizedBox(
              height: 1.h,
            ),
            Text('Try applying in different jobs so we can show you',
                textAlign: TextAlign.center,
                style: Styles.textStyle13.copyWith(
                  color: AppTheme.neutral5,
                ))
          ],
        ),
      ),
    );
  }
}
