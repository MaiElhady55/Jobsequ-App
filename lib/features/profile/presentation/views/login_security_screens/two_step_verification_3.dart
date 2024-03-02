import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/app_widgets/custom_phone_textformfield.dart';
import 'package:jobsque/core/app_widgets/custom_textformfield.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';

import 'package:sizer/sizer.dart';




class TwoStepVerification3 extends StatelessWidget {
   const TwoStepVerification3({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
     TextEditingController phoneController=TextEditingController(text: '0100-666-7234');
   TextEditingController passwordController=TextEditingController(text: '123456');
    return Scaffold(
      appBar:  customAppBar("Two-step verification", context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add phone number',
              style: Styles.textStyle13.copyWith(color:  AppTheme.neutral9,)
            ),
            SizedBox(height: 0.5.h,),
            Text(
              'We will send a verification code to this number',
              style:  Styles.textStyle11.copyWith(color:  AppTheme.neutral5,)
            ),
            SizedBox(height: 2.h,),
            CustomPhoneTextFormField(controller: phoneController,),
            SizedBox(height: 2.h,),
            Text(
              'Enter your password',
              style:  Styles.textStyle13.copyWith(color:  AppTheme.neutral9,)
            ),
            SizedBox(height: 1.h,),
            CustomTextFormField(
              controller: passwordController,
              hintText: "Password",
              prifix:  const Icon(Iconsax.lock),
              prefixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? AppTheme.neutral9
                  : AppTheme.neutral3),
              suffixIcon: IconButton(onPressed: () {  },
                icon: const Icon(Iconsax.eye_slash),
              ),
              suffixIconColor:MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? AppTheme.neutral9
                  : AppTheme.neutral4),
              type: TextInputType.visiblePassword,
              obscureText: true,
            ),
            const Spacer(),
            CustomMainButton(onPressed: () {
              Navigator.pushNamed(context, AppRoute.twoStepVerification4);
            },text: "Send Code"),

          ],
        ),
      ),
    );
  }
}
