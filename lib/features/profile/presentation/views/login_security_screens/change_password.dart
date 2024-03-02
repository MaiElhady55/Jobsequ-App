import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/app_widgets/custom_textformfield.dart';
import 'package:jobsque/core/app_widgets/snack_bar.dart';
import 'package:jobsque/core/constance/enums.dart';
import 'package:jobsque/core/network/local/cache_helper.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/profile/presentation/view_models/cubit/profile_cubit.dart';

import 'package:sizer/sizer.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  late ProfileCubit cubit;
  final formKey = GlobalKey<FormState>();
  final List<Color> errorColors = [
    AppTheme.neutral4,
    AppTheme.danger5,
    AppTheme.success5
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cubit.errorText = '';
    cubit.errorText2 = '';
    cubit.errorText3 = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Change password", context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Text('Enter your old password',
                        style: Styles.textStyle13.copyWith(
                          color: AppTheme.neutral9,
                        )),
                    SizedBox(
                      height: 1.h,
                    ),
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return CustomTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              cubit.changeThirdColorIndex(0);
                              return 'Please Enter Your old Password';
                            }
                            if (value !=
                                CachHelper.getData(
                                    key: MySharedKeys.password.toString())) {
                              cubit.changeThirdColorIndex(1);
                              return 'Please Enter Your old Password';
                            }
                            cubit.changeThirdColorIndex(2);
                            cubit.errorText3 = 'Please Enter Your old Password';
                            return null;
                          },
                          errorColor: errorColors[cubit.colorIndex2],
                          errorText: cubit.errorText3,
                          controller: oldPasswordController,
                          hintText: "Old Password",
                          prifix: const Icon(Iconsax.lock),
                          prefixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
                                  ? AppTheme.neutral9
                                  : AppTheme.neutral3),
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.changeIcon();
                            },
                            icon: cubit.obscure
                                ? const Icon(Iconsax.eye_slash)
                                : const Icon(Iconsax.eye),
                          ),
                          suffixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
                                  ? AppTheme.neutral9
                                  : AppTheme.neutral4),
                          type: TextInputType.visiblePassword,
                          obscureText: cubit.obscure,
                        );
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text('Enter your new password',
                        style: Styles.textStyle13.copyWith(
                          color: AppTheme.neutral9,
                        )),
                    SizedBox(
                      height: 1.h,
                    ),
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return CustomTextFormField(
                          validator: (value) {
                            cubit.password = value!;
                            if (value.isEmpty) {
                              cubit.changeColorIndex(0);
                              return 'Password must be at least 8 characters';
                            }
                            if (value.length < 8) {
                              cubit.changeColorIndex(1);

                              return 'Password must be at least 8 characters';
                            }
                            cubit.changeColorIndex(2);
                            cubit.errorText =
                                'Password must be at least 8 characters';
                            return null;
                          },
                          errorColor: errorColors[cubit.colorIndex],
                          errorText: cubit.errorText,
                          controller: newPasswordController,
                          hintText: "new Password",
                          prifix: const Icon(Iconsax.lock),
                          prefixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
                                  ? AppTheme.neutral9
                                  : AppTheme.neutral3),
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.changeIcon();
                            },
                            icon: cubit.obscure
                                ? const Icon(Iconsax.eye_slash)
                                : const Icon(Iconsax.eye),
                          ),
                          suffixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
                                  ? AppTheme.neutral9
                                  : AppTheme.neutral4),
                          type: TextInputType.visiblePassword,
                          obscureText: cubit.obscure,
                        );
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text('Confirm your new password',
                        style: Styles.textStyle13.copyWith(
                          color: AppTheme.neutral9,
                        )),
                    SizedBox(
                      height: 1.h,
                    ),
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return CustomTextFormField(
                          validator: (value) {
                            // since we stored the password value in the state, we can access the
                            // variable here and compare the value
                            if (value != cubit.password) {
                              cubit.changeSecondColorIndex(1);
                              return 'Both password must match';
                            } else {
                              cubit.changeSecondColorIndex(2);
                              cubit.errorText2 = 'Both password must match';
                              return null;
                            }
                          },
                          errorColor: errorColors[cubit.colorIndex1],
                          errorText: cubit.errorText2,
                          controller: confirmNewPasswordController,
                          hintText: "Confirm Password",
                          prifix: const Icon(Iconsax.lock),
                          prefixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
                                  ? AppTheme.neutral9
                                  : AppTheme.neutral3),
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.changeIcon();
                            },
                            icon: cubit.obscure
                                ? const Icon(Iconsax.eye_slash)
                                : const Icon(Iconsax.eye),
                          ),
                          suffixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
                                  ? AppTheme.neutral9
                                  : AppTheme.neutral4),
                          type: TextInputType.visiblePassword,
                          obscureText: cubit.obscure,
                        );
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    if (state is UpdateProfileSuccessfully) {
                      showSuccessSnackBar(
                          context: context,
                          message: 'Password Updated Successfully');

                      Navigator.pop(context);
                    } else if (state is UpdateProfileError) {
                      showErrorSnackBar(
                          context: context,
                          message: 'There is something went wrong.Try Again');
                    }
                  },
                  builder: (context, state) {
                    return BuildCondition(
                      condition: state is! UpdateProfileLoading,
                      builder: (context) => CustomMainButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.updateProfileNameAndPassword(
                                  name: cubit.profile[0].name!,
                                  password: newPasswordController.text);
                            }
                          },
                          text: "Save"),
                      fallback: (context) => const CircularProgressIndicator(),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
