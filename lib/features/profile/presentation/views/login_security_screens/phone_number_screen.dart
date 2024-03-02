import 'package:flutter/material.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/app_widgets/custom_phone_textformfield.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';

import 'package:sizer/sizer.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController =
        TextEditingController(text: '0100-666-7234');
    return Scaffold(
      appBar: customAppBar("Phone Number", context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Main phone number',
                style: Styles.textStyle13.copyWith(
                  color: AppTheme.neutral9,
                )),
            SizedBox(
              height: 1.h,
            ),
            CustomPhoneTextFormField(
              controller: phoneController,
            ),
            SizedBox(
              height: 2.h,
            ),
            // CustomNotificationsSettingItem(  NotificationSettingsModel(label: 'Use the phone number to reset your password', mode: true),
            // textColor: AppTheme.neutral5,
            //   fontSize: 11.5,
            //
            // ),
            const Spacer(),
            CustomMainButton(onPressed: () {}, text: "Save"),
          ],
        ),
      ),
    );
  }
}
