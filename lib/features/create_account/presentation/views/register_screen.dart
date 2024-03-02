import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/app_widgets/custom_text_button.dart';
import 'package:jobsque/core/app_widgets/custom_textformfield.dart';
import 'package:jobsque/core/app_widgets/home_indicator.dart';
import 'package:jobsque/core/app_widgets/snack_bar.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/app_images.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/create_account/presentation/view_models/cubit/register_cubit.dart';
import 'package:jobsque/features/login/presentation/views/widgets/custom_line.dart';
import 'package:jobsque/features/login/presentation/views/widgets/custom_social_button.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<Color> errorColors = [AppTheme.danger5, AppTheme.success5];
  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context);
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is RegisterFailureState || current is RegisterSuccessState,
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          if (state.registerModel?.status ?? false) {
            showSuccessSnackBar(
                context: context, message: 'Registered Successfully');
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoute.registerWorkScreen, (route) => false);
          }
        } else if (state is RegisterFailureState) {
          print('EERROOORR ${state.errMessage}');
          showErrorSnackBar(
              context: context,
              message: 'There is something went wrong.Try Again');
        }
      },
      child: Scaffold(
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
                      child: Text('Create Account', style: Styles.textStyle28),
                    ),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                          'Please create an account to find your dream job',
                          style: Styles.textStyle16W400),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CustomTextFormField(
                      controller: userNameController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'username must not be empty';
                        } else {
                          return null;
                        }
                      },
                      hintText: "UserName",
                      type: TextInputType.name,
                      prifix: const Icon(Iconsax.user),
                      prefixIconColor: MaterialStateColor.resolveWith(
                          (states) => states.contains(MaterialState.focused)
                              ? AppTheme.neutral9
                              : AppTheme.neutral3),
                      obscureText: false,
                      //lableText: 'Email Or UserName',
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'email must not be empty';
                        }
                        final bool isValid = EmailValidator.validate(value);
                        if (!isValid) {
                          return "please enter right email";
                        } else {
                          return null;
                        }
                      },
                      hintText: "Email",
                      type: TextInputType.emailAddress,
                      prifix: const Icon(Iconsax.user),
                      prefixIconColor: MaterialStateColor.resolveWith(
                          (states) => states.contains(MaterialState.focused)
                              ? AppTheme.neutral9
                              : AppTheme.neutral3),
                      obscureText: false,
                      //lableText: 'Email Or UserName',
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    BlocBuilder<RegisterCubit, RegisterState>(
                      buildWhen: (previous, current) =>
                          current is ChangePasswordVisibilityState,
                      builder: (context, state) {
                        return CustomTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password must not be empty';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            } else {
                              return null;
                            }
                          },
                          controller: passwordController,
                          textInputAction: TextInputAction.done,
                          hintText: "Password",
                          //errorColor: errorColors[cubit.colorIndex],
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
                      height: 14.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Text('Already have an account?',
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
                    BlocBuilder<RegisterCubit, RegisterState>(
                      buildWhen: (previous, current) =>
                          current is RegisterFailureState ||
                          current is RegisterSuccessState ||
                          current is RegisterLoadingState,
                      builder: (context, state) {
                        return CustomMainButton(
                          text: 'Create Account',
                          isLoading: state is RegisterLoadingState,
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              cubit.registerUser(
                                  email: emailController.text.trim(),
                                  userName: userNameController.text.trim(),
                                  passsword: passwordController.text.trim());
                            }
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Row(
                      children: [
                        Expanded(child: CustomLine()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                          child: Text('OR',
                              textAlign: TextAlign.center,
                              style: Styles.textStyle14
                                  .copyWith(color: AppTheme.primary5)),
                        ),
                        Expanded(child: CustomLine()),
                      ],
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomSocialButton(
                            onPressed: () {},
                            text: "Google",
                            image: AppImages.google,
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Expanded(
                          child: CustomSocialButton(
                            onPressed: () {},
                            text: "Facebook",
                            image: AppImages.Facebook,
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ),
        bottomNavigationBar: FractionallySizedBox(
            widthFactor: 0.36, child: homeIndicator(context)),
      ),
    );
  }
}
