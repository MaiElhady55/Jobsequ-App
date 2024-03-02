import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_widgets/custom_phone_textformfield.dart';
import 'package:jobsque/core/app_widgets/custom_textformfield.dart';
import 'package:jobsque/core/constance/constance.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/custom_text_rich.dart';
import 'package:sizer/sizer.dart';

class BioDataScreen extends StatelessWidget {
  const BioDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Biodata',
                  style: Styles.textStyle16.copyWith(
                    fontSize: 16.5,
                    color: AppTheme.neutral9,
                  )),
              Text('Fill in your bio data correctly',
                  style: Styles.textStyle11.copyWith(
                    color: AppTheme.neutral5,
                  )),
              SizedBox(
                height: 3.h,
              ),
              CustomTextRich(title: 'Full Name'),
              SizedBox(
                height: 1.h,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'cannot be empty';
                  } else {
                    return null;
                  }
                },
                controller: usernameController,
                hintText: "Username",
                type: TextInputType.name,
                prifix: const Icon(Iconsax.user),
                prefixIconColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.focused)
                        ? AppTheme.neutral9
                        : AppTheme.neutral3),
                obscureText: false,
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextRich(title: 'Email'),
              SizedBox(
                height: 1.h,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'email must not be empty';
                  }
                  final bool isValid = EmailValidator.validate(value);
                  if (!isValid) {
                    return "please enter right email";
                  }
                  return null;
                },
                controller: emailController,
                hintText: "Email",
                type: TextInputType.emailAddress,
                prifix: const Icon(Iconsax.sms),
                prefixIconColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.focused)
                        ? AppTheme.neutral9
                        : AppTheme.neutral3),
                obscureText: false,
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextRich(title: 'No.Headphone'),
              SizedBox(
                height: 1.h,
              ),
              CustomPhoneTextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'cannot be empty';
                    }
                    if (value.length < 10) {
                      return 'Phone must be 11 characters';
                    } else {
                      return null;
                    }
                  },
                  controller: phoneController),
            ],
          )),
    );
  }
}
