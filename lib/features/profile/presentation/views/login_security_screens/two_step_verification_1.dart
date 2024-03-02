import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class TwoStepVerification1 extends StatelessWidget {
  const TwoStepVerification1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TextEditingController phoneController=TextEditingController(text: '0100-666-7234');
    return Scaffold(
      appBar: customAppBar("Two-step verification", context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CustomNotificationsSettingItem(  NotificationSettingsModel(label: 'Secure your account with two-step verification', mode: false),
            //   textColor: AppTheme.neutral5,
            //   fontSize: 11.5,
            //
            // ),
            SizedBox(
              height: 4.h,
            ),
            const TwoStepVerificationTile(
                icon: Iconsax.sms,
                text:
                    "Two-step verification provides additional security by asking for a verification code every time you log in on another device."),
            SizedBox(
              height: 2.h,
            ),
            const TwoStepVerificationTile(
                icon: Iconsax.external_drive,
                text:
                    "Adding a phone number or using an authenticator will help keep your account safe from harm."),

            const Spacer(),
            CustomMainButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.twoStepVerification2);
                },
                text: "Next"),
          ],
        ),
      ),
    );
  }
}

class TwoStepVerificationTile extends StatelessWidget {
  final IconData icon;
  final String text;
  const TwoStepVerificationTile(
      {Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 11.w,
        height: 5.h,
        decoration: const ShapeDecoration(
          color: AppTheme.primary1,
          shape: CircleBorder(),
        ),
        child: Center(
            child: Icon(
          icon,
          color: AppTheme.primary5,
        )),
      ),
      title: Text(text,
          style: Styles.textStyle11.copyWith(
            color: AppTheme.neutral5,
          )),
    );
  }
}
