import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/app_widgets/home_indicator.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_images.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class SuccessCreatePasswordScreen extends StatelessWidget {
  const SuccessCreatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset(AppImages.successPassword)),
            SizedBox(
              height: 2.h,
            ),
            Text('Password changed successfully!',
                textAlign: TextAlign.center, style: Styles.textStyle20),
            SizedBox(
              height: 1.h,
            ),
            Text(
                'Your password has been changed successfully, we will let you know if there are more problems with your account',
                textAlign: TextAlign.center,
                style: Styles.textStyle13.copyWith(fontSize: 12.5.sp)),
            const Spacer(),
            CustomMainButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoute.loginScreen, (route) => false);
                },
                text: "Get Started"),
          ],
        ),
      ),
      bottomNavigationBar: FractionallySizedBox(
          widthFactor: 0.36, child: homeIndicator(context)),
    );
  }
}
