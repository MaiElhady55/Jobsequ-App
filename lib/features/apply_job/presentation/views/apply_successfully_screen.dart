import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class ApplyJobSuccessfully extends StatelessWidget {
  const ApplyJobSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Apply Job", context, leading: false),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                      "assets/images/home/Data Ilustration (1).svg"),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text('Your data has been successfully sent',
                      textAlign: TextAlign.center,
                      style: Styles.textStyle20.copyWith(
                        color: AppTheme.neutral9,
                      )),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    'You will get a message from our team, about the announcement of employee acceptance',
                    textAlign: TextAlign.center,
                    style: Styles.textStyle13.copyWith(
                      color: AppTheme.neutral5,
                    ),
                  )
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: CustomMainButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoute.layoutScreen, (route) => false);
                    },
                    text: "Back to home"))
          ],
        ),
      ),
    );
  }
}
