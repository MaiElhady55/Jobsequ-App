import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_images.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class SuccessRegisterScreen extends StatelessWidget {
  const SuccessRegisterScreen({super.key});

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
            SvgPicture.asset(AppImages.successRegistration),
            SizedBox(
              height: 2.h,
            ),
            Text('Your account has been set up!',
                textAlign: TextAlign.center, style: Styles.textStyle20),
            SizedBox(
              height: 1.h,
            ),
            Text('We have customized feeds according to your preferences',
                textAlign: TextAlign.center, style: Styles.textStyle13),
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
    );
  }
}
