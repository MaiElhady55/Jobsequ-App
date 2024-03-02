import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';

import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class TwoStepVerification2 extends StatelessWidget {
  TwoStepVerification2({Key? key}) : super(key: key);

  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
        value: "Telephone number (SMS)",
        child: Text('Telephone number (SMS)',
            style: Styles.textStyle11.copyWith(
              color: AppTheme.neutral9,
            ))),
    DropdownMenuItem(
        value: "Authenticator App",
        child: Text('Authenticator App',
            style: Styles.textStyle11.copyWith(
              color: AppTheme.neutral9,
            ))),
  ];

  String selectedValue = "Telephone number (SMS)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Two-step verification", context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CustomNotificationsSettingItem(  NotificationSettingsModel(label: 'Secure your account with two-step verification', mode: true),
            //   textColor: AppTheme.neutral5,
            //   fontSize: 11.5,
            //
            // ),
            SizedBox(
              height: 4.h,
            ),
            Text('Select a verification method',
                style: Styles.textStyle13.copyWith(
                  color: AppTheme.neutral9,
                )),
            SizedBox(
              height: 1.h,
            ),
            DropdownButtonFormField(
                icon: const Icon(
                  Iconsax.arrow_down_14,
                  color: AppTheme.neutral9,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppTheme.neutral3,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.primary5),
                  ),
                ),
                value: selectedValue,
                onChanged: (String? newValue) {
                  selectedValue = newValue!;
                },
                items: menuItems),
            SizedBox(
              height: 2.h,
            ),
            Text(
                'Note : Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.',
                style: Styles.textStyle11.copyWith(
                  color: AppTheme.neutral5,
                )),
            const Spacer(),
            CustomMainButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.twoStepVerification3);
                },
                text: "Next"),
          ],
        ),
      ),
    );
  }
}
