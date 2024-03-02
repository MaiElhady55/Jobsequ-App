import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/app_widgets/home_indicator.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_images.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class CheckMailForgotPasswordScreen extends StatelessWidget {
  const CheckMailForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.checkEmail),
            SizedBox(
              height: 2.h,
            ),
            Text('Check your Email',
                textAlign: TextAlign.center, style: Styles.textStyle20),
            SizedBox(
              height: 1.h,
            ),
            Text('We have sent a reset password to your email address',
                textAlign: TextAlign.center, style: Styles.textStyle13),
            const Spacer(),
            CustomMainButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, AppRoute.createNewPasswordScreen);
                },
                text: "Open Email App"),
          ],
        ),
      ),
      bottomNavigationBar: FractionallySizedBox(
          widthFactor: 0.36, child: homeIndicator(context)),
    );
  }
}
