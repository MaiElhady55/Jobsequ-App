import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/app_widgets/custom_text_button.dart';
import 'package:jobsque/core/app_widgets/custom_textformfield.dart';
import 'package:jobsque/core/app_widgets/home_indicator.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/app_images.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.6.h),
          child: SvgPicture.asset(AppImages.logo),
        ),
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text('Reset Password', style: Styles.textStyle24),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                      'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
                      style: Styles.textStyle13),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'email or userName must not be empty';
                      }
                      final bool isValid = EmailValidator.validate(value);
                      if (!isValid) {
                        return "please enter right email";
                      } else {
                        return null;
                      }
                    },
                    hintText: "Enter your Email",
                    type: TextInputType.emailAddress,
                    prifix: const Icon(Iconsax.sms),
                    prefixIconColor: MaterialStateColor.resolveWith((states) =>
                        states.contains(MaterialState.focused)
                            ? AppTheme.neutral9
                            : AppTheme.neutral3),
                    obscureText: false,
                    //lableText: 'Email Or UserName',
                  ),
                  SizedBox(
                    height: 38.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text('You remember your password',
                            style: Styles.textStyle14
                                .copyWith(fontWeight: FontWeight.w500)),
                      ),
                      CustomTextButton(
                          function: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                AppRoute.loginScreen, (route) => false);
                          },
                          title: 'Login',
                          textStyle: Styles.textStyle14.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppTheme.primary5)),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomMainButton(
                    text: 'Request Password Reset',
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRoute.checkEmailForgetPasswordScreen);
                    },
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                ],
              )),
        ),
      ),
      bottomNavigationBar: FractionallySizedBox(
          widthFactor: 0.36, child: homeIndicator(context)),
    );
  }
}
