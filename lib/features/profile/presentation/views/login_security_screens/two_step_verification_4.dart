import 'package:flutter/material.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';

class TwoStepVerification4 extends StatelessWidget {
  const TwoStepVerification4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OtpFieldController otpController = OtpFieldController();
    return Scaffold(
      appBar: customAppBar("Two-step verification", context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enter the 6 digit code',
                style: Styles.textStyle13.copyWith(
                  color: AppTheme.neutral9,
                )),
            SizedBox(
              height: 1.h,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text:
                          'Please confirm your account by entering the authorization code sen to ',
                      style: Styles.textStyle11.copyWith(
                        color: AppTheme.neutral5,
                      )),
                  TextSpan(
                      text: '****-****-7234',
                      style: Styles.textStyle11.copyWith(
                        color: AppTheme.neutral9,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            OTPTextField(
                controller: otpController,
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 8,
                style: TextStyle(
                  color: const Color(0xFF222741),
                  fontSize: 12.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,
                ),
                onChanged: (pin) {
                  print("Changed: " + pin);
                },
                onCompleted: (pin) {
                  print("Completed: " + pin);
                }),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      
                    },
                    child: Text("Resend Code",
                        style: Styles.textStyle13.copyWith(
                          color: AppTheme.neutral4,
                        ))),
                SizedBox(
                  width: 1.w,
                ),
                Text("42s",
                    style: Styles.textStyle13.copyWith(
                      color: AppTheme.neutral5,
                    )),
              ],
            ),
            const Spacer(),
            CustomMainButton(onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, AppRoute.layoutScreen, (route) => false);
            }, text: "Verify"),
          ],
        ),
      ),
    );
  }
}
