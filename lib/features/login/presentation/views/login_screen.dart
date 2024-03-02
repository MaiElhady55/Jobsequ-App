import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/app_widgets/custom_text_button.dart';
import 'package:jobsque/core/app_widgets/custom_textformfield.dart';
import 'package:jobsque/core/app_widgets/snack_bar.dart';
import 'package:jobsque/core/constance/enums.dart';
import 'package:jobsque/core/network/local/cache_helper.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/app_images.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/login/presentation/view_models/google_login/google_login_cubit.dart';
import 'package:jobsque/features/login/presentation/views/widgets/custom_line.dart';
import 'package:jobsque/features/login/presentation/views/widgets/custom_social_button.dart';
import 'package:jobsque/features/login/presentation/view_models/login_cubit/login_cubit.dart';

import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController(
      text: CachHelper.getData(key: MySharedKeys.email.toString()));

  final TextEditingController passwordController = TextEditingController(
      text: CachHelper.getData(key: MySharedKeys.password.toString()));
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginFailureState || current is LoginSuccessState,
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.loginModel.status == true) {
            CachHelper.saveDate(
                    key: MySharedKeys.token.toString(),
                    value: state.loginModel.token)
                .then((value) {
              CachHelper.saveDate(
                      key: MySharedKeys.userId.toString(),
                      value: state.loginModel.user?.id.toString()).then((value) => 
                      CachHelper.saveDate(
                      key: MySharedKeys.name.toString(),
                      value: state.loginModel.user?.name.toString())
                      )
                  .then((value) {
                print(state.loginModel.token);
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoute.layoutScreen, (route) => false);
                CachHelper.saveDate(
                    key: MySharedKeys.rememberMe.toString(),
                    value: '${LoginCubit.get(context).isChecked}');
              });
            });
            showSuccessSnackBar(
                context: context, message: 'Logged Successfully');
          }
        } else if (state is LoginFailureState) {
          showErrorSnackBar(context: context, message: state.errMessage);
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
                      child: Text('Login', style: Styles.textStyle28),
                    ),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text('Please login to find your dream job',
                          style: Styles.textStyle16W400),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
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
                      hintText: "Email Or UserName",
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
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return CustomTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password must not be empty Password';
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
                          prifix: const Icon(Iconsax.lock),
                          prefixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
                                  ? AppTheme.neutral9
                                  : AppTheme.neutral3),
                          suffixIcon: IconButton(
                            onPressed: () {
                              LoginCubit.get(context)
                                  .ChangePasswordVisibility();
                            },
                            icon: LoginCubit.get(context).secirty
                                ? const Icon(Iconsax.eye_slash)
                                : const Icon(Iconsax.eye),
                          ),
                          suffixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
                                  ? AppTheme.neutral9
                                  : AppTheme.neutral4),
                          type: TextInputType.visiblePassword,
                          obscureText: LoginCubit.get(context).secirty,
                          //lableText: 'Password',
                        );
                      },
                    ),
                    SizedBox(
                      height: 1.4.h,
                    ),
                    Row(
                      children: [
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            return Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: LoginCubit.get(context).isChecked,
                              activeColor: AppTheme.primary5,
                              checkColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              side: const BorderSide(
                                color: AppTheme.neutral4,
                              ),
                              onChanged: (value) {
                                LoginCubit.get(context).changeCheckBox(value);
                              },
                            );
                          },
                        ),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Text('Remember me',
                              style: Styles.textStyle14.copyWith(
                                color: AppTheme.neutral8,
                              )),
                        ),
                        const Spacer(),
                        CustomTextButton(
                          function: () {
                            Navigator.pushNamed(
                                context, AppRoute.forgetPasswordScreen);
                          },
                          textStyle: Styles.textStyle14.copyWith(
                            color: AppTheme.primary5,
                          ),
                          title: 'Forgot Password?',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Text('Dont’t have an account?',
                              style: Styles.textStyle14
                                  .copyWith(fontWeight: FontWeight.w500)),
                        ),
                        CustomTextButton(
                            function: () {
                              Navigator.pushNamed(
                                  context, AppRoute.registerScreen);
                            },
                            title: 'Register',
                            textStyle: Styles.textStyle14.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppTheme.primary5)),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      buildWhen: (previous, current) =>
                          current is LoginFailureState ||
                          current is LoginLoadingState ||
                          current is LoginSuccessState,
                      builder: (context, state) {
                        return CustomMainButton(
                          isLoading: state is LoginLoadingState,
                          text: 'Login',
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              LoginCubit.get(context).loginUser(
                                  email: emailController.text.trim(),
                                  passsword: passwordController.text.trim());
                              CachHelper.saveDate(
                                  key: MySharedKeys.email.toString(),
                                  value: emailController.text);
                              CachHelper.saveDate(
                                  key: MySharedKeys.password.toString(),
                                  value: passwordController.text);
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
                          child: Text('Or',
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
                        BlocBuilder<GoogleLoginCubit, GoogleLoginState>(
                          buildWhen: (previous, current) =>
                              current is GoogleLoginLoadingState ||
                              current is GoogleLoginFailureState ||
                              current is GoogleLoginSuccessState,
                          builder: (context, state) {
                            return Expanded(
                              child: CustomSocialButton(
                                isLoading: state is GoogleLoginLoadingState,
                                onPressed: () {
                                  GoogleLoginCubit.get(context)
                                      .loginWithGoogle();
                                },
                                text: "Google",
                                image: AppImages.google,
                              ),
                            );
                          },
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
      ),
    );
  }
}
