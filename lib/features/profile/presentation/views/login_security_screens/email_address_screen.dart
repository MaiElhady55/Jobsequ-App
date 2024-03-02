import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/app_widgets/custom_textformfield.dart';
import 'package:jobsque/core/constance/enums.dart';
import 'package:jobsque/core/network/local/cache_helper.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';

import 'package:sizer/sizer.dart';

class EmailAddressScreen extends StatelessWidget {
  const EmailAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(
        text: CachHelper.getData(key: MySharedKeys.email.toString()));
    return Scaffold(
      appBar: customAppBar("Email Address", context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Main e-mail address',
                    style: Styles.textStyle13.copyWith(
                      color: AppTheme.neutral9,
                    )),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextFormField(
                  controller: emailController,
                  prifix: const Icon(Iconsax.sms),
                  prefixIconColor: MaterialStateColor.resolveWith((states) =>
                      states.contains(MaterialState.focused)
                          ? AppTheme.neutral9
                          : AppTheme.neutral3),
                  hintText: 'Email address',
                  obscureText: false,
                  type: TextInputType.emailAddress,
                ),
                const Spacer(),
                CustomMainButton(onPressed: () {}, text: "Save"),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomMainButton(onPressed: () {}, text: "Save"),
            ),
          ],
        ),
      ),
    );
  }
}
