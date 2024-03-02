import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/app_widgets/custom_textformfield.dart';
import 'package:jobsque/core/app_widgets/home_indicator.dart';
import 'package:jobsque/core/app_widgets/snack_bar.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/app_images.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/forget_password/presentation/view_models/cubit/forget_password_cubit.dart';
import 'package:sizer/sizer.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheckController = TextEditingController();

  late ForgetPasswordCubit cubit;

  var formKey = GlobalKey<FormState>();
  final List<Color> errorColors = [
    AppTheme.neutral4,
    AppTheme.danger5,
    AppTheme.success5
  ];
  @override
  void initState() {
    cubit = ForgetPasswordCubit.get(context);
    super.initState();
  }

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
                    child:
                        Text('Create New Password', style: Styles.textStyle24),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                      'Set your new password so you can login and access Jobsque',
                      style: Styles.textStyle13),
                  SizedBox(
                    height: 4.h,
                  ),
                  BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                    builder: (context, state) {
                      return CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password must not be empty ';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          } else {
                            return null;
                          }
                        },
                        controller: passwordController,
                        hintText: "New Password",
                        prifix: const Icon(Iconsax.lock),
                        prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? AppTheme.neutral9
                                : AppTheme.neutral3),
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.ChangePasswordVisibility();
                          },
                          icon: cubit.secirty
                              ? const Icon(Iconsax.eye_slash)
                              : const Icon(Iconsax.eye),
                        ),
                        suffixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? AppTheme.neutral9
                                : AppTheme.neutral4),
                        type: TextInputType.visiblePassword,
                        obscureText: cubit.secirty,
                        //lableText: 'Password',
                      );
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                    builder: (context, state) {
                      return CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password must not be empty ';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          if (value != passwordController) {
                            return 'Password does not match';
                          } else {
                            return null;
                          }
                        },
                        controller: passwordCheckController,
                        hintText: "Confirm New Password",
                        prifix: const Icon(Iconsax.lock),
                        prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? AppTheme.neutral9
                                : AppTheme.neutral3),
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.ChangePasswordVisibilityconfirm();
                          },
                          icon: cubit.secirty2
                              ? const Icon(Iconsax.eye_slash)
                              : const Icon(Iconsax.eye),
                        ),
                        suffixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? AppTheme.neutral9
                                : AppTheme.neutral4),
                        type: TextInputType.visiblePassword,
                        obscureText: cubit.secirty2,
                        //lableText: 'Password',
                      );
                    },
                  ),
                  SizedBox(
                    height: 38.h,
                  ),
                  CustomMainButton(
                    text: 'Reset Password',
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        showSuccessSnackBar(
                            context: context,
                            message: 'Reset Paaword Successfuly');
                        Navigator.pushNamed(
                            context, AppRoute.successForgetPasswordScreen);
                      }
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
