import 'package:flutter/material.dart';
import 'package:jobsque/core/animations/page_slide_transition.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/features/apply_job/presentation/views/apply_job_screen.dart';
import 'package:jobsque/features/apply_job/presentation/views/apply_successfully_screen.dart';
import 'package:jobsque/features/apply_job/presentation/views/image_screen.dart';
import 'package:jobsque/features/apply_job/presentation/views/job_details_screen.dart';
import 'package:jobsque/features/apply_job/presentation/views/pdf_screen.dart';
import 'package:jobsque/features/home/data/models/job_model/data.dart';
import 'package:jobsque/features/home/presentation/views/home_screen.dart';
import 'package:jobsque/features/login/presentation/views/login_screen.dart';
import 'package:jobsque/features/create_account/presentation/views/location_register_screen.dart';
import 'package:jobsque/features/create_account/presentation/views/register_screen.dart';
import 'package:jobsque/features/create_account/presentation/views/success_register_screen.dart';
import 'package:jobsque/features/create_account/presentation/views/work_register_screen.dart';
import 'package:jobsque/features/forget_password/presentation/views/check_mail_password_screen.dart';
import 'package:jobsque/features/forget_password/presentation/views/create_new_password_screen.dart';
import 'package:jobsque/features/forget_password/presentation/views/forget_password_screen.dart';
import 'package:jobsque/features/forget_password/presentation/views/success_create_password_screen.dart';
import 'package:jobsque/features/home_layout/presentation/views/layout_screen.dart';
import 'package:jobsque/features/notification/presentation/views/notification_screen.dart';
import 'package:jobsque/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:jobsque/features/profile/data/models/pdf_args.dart';
import 'package:jobsque/features/profile/presentation/views/complete_profile_screen.dart';
import 'package:jobsque/features/profile/presentation/views/edit_details_screen.dart';
import 'package:jobsque/features/profile/presentation/views/education_screen.dart';
import 'package:jobsque/features/profile/presentation/views/experience_screen.dart';
import 'package:jobsque/features/profile/presentation/views/help_center_screen.dart';
import 'package:jobsque/features/profile/presentation/views/language_screen.dart';
import 'package:jobsque/features/profile/presentation/views/login_security_screen.dart';
import 'package:jobsque/features/profile/presentation/views/login_security_screens/change_password.dart';
import 'package:jobsque/features/profile/presentation/views/login_security_screens/email_address_screen.dart';
import 'package:jobsque/features/profile/presentation/views/login_security_screens/phone_number_screen.dart';
import 'package:jobsque/features/profile/presentation/views/login_security_screens/two_step_verification_1.dart';
import 'package:jobsque/features/profile/presentation/views/login_security_screens/two_step_verification_2.dart';
import 'package:jobsque/features/profile/presentation/views/login_security_screens/two_step_verification_3.dart';
import 'package:jobsque/features/profile/presentation/views/login_security_screens/two_step_verification_4.dart';
import 'package:jobsque/features/profile/presentation/views/notification_settings_screen.dart';
import 'package:jobsque/features/profile/presentation/views/portfolio_screen.dart';
import 'package:jobsque/features/profile/presentation/views/privacy_policy_screen.dart';
import 'package:jobsque/features/profile/presentation/views/terms_conditions_screen.dart';
import 'package:jobsque/features/search/presentation/views/search_screen.dart';
import 'package:jobsque/features/splash/presentation/views/splash_screen.dart';

Route? onGenerateRouter(RouteSettings settings) {
  switch (settings.name) {
    case AppRoute.splashScreen:
      return MaterialPageRoute(builder: (_) => const splashScreen());
    case AppRoute.onBoardingScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const OnboardingScreen());

    case AppRoute.loginScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const LoginScreen());

    case AppRoute.forgetPasswordScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const ForgotPasswordScreen());

    case AppRoute.checkEmailForgetPasswordScreen:
      return PageSlideTransition(
          direction: AxisDirection.left,
          page: const CheckMailForgotPasswordScreen());

    case AppRoute.createNewPasswordScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const CreateNewPasswordScreen());

    case AppRoute.successForgetPasswordScreen:
      return PageSlideTransition(
          direction: AxisDirection.left,
          page: const SuccessCreatePasswordScreen());

    case AppRoute.registerScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const RegisterScreen());

    case AppRoute.registerWorkScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const RegisterWorkScreen());

    case AppRoute.locationRegisterScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const LocationRegisterScreen());

    case AppRoute.successRegisterScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: const SuccessRegisterScreen());

    case AppRoute.layoutScreen:
      return MaterialPageRoute(builder: (_) => const layoutScreen());

    case AppRoute.homeScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: HomeScreen());
    case AppRoute.notificationScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const NotificationScreen());

    case AppRoute.jobDetailsScreen:
      final args = settings.arguments as JobData;
      return PageSlideTransition(
          direction: AxisDirection.right,
          page: JobDetailsScreen(
            jobData: args,
          ));

    case AppRoute.applyJobScreen:
      final args = settings.arguments as JobData;
      return PageSlideTransition(
          direction: AxisDirection.right,
          page: ApplyJobScreen(
            jobData: args,
          ));

    case AppRoute.applyJobSuccessfullyScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const ApplyJobSuccessfully());

    case AppRoute.pdfScreen:
      final args = settings.arguments as PdfScreenArguments;
      return PageSlideTransition(
          direction: AxisDirection.left,
          page: PDFScreen(
            text: args.text,
            selectedCV: args.file,
          ));

    case AppRoute.imageScreen:
      return PageSlideTransition(
          direction: AxisDirection.left, page: ImageScreen());

    case AppRoute.searchScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: SearchScreen());

    case AppRoute.editDetailsScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: EditDetalisScreen());

    case AppRoute.portfolioScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const PortfolioScreen());

    case AppRoute.languageScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const LanguageScreen());

    case AppRoute.notificationsSettingsScreen:
      return PageSlideTransition(
          direction: AxisDirection.right,
          page: const NotificationsSettingsScreen());

    case AppRoute.privacyAndPolicyScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const PrivacyAndPolicyScreen());

    case AppRoute.helpCenterScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: HelpCenterScreen());

    case AppRoute.termsAndConditionsScreen:
      return PageSlideTransition(
          direction: AxisDirection.right,
          page: const TermsAndConditionsScreen());

    case AppRoute.loginAndSecurityScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const LoginAndSecurityScreen());

    case AppRoute.emailAddressScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: EmailAddressScreen());

    case AppRoute.phoneNumberScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: PhoneNumberScreen());

    case AppRoute.changePasswordScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: ChangePasswordScreen());

    case AppRoute.twoStepVerification1:
      return PageSlideTransition(
          direction: AxisDirection.right, page: TwoStepVerification1());

    case AppRoute.twoStepVerification2:
      return PageSlideTransition(
          direction: AxisDirection.right, page: TwoStepVerification2());

    case AppRoute.twoStepVerification3:
      return PageSlideTransition(
          direction: AxisDirection.right, page: TwoStepVerification3());

    case AppRoute.twoStepVerification4:
      return PageSlideTransition(
          direction: AxisDirection.right, page: TwoStepVerification4());
    case AppRoute.experienceScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const ExperienceScreen());
    case AppRoute.educationScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const EducationScreen());
    case AppRoute.completeProfileScreen:
      return PageSlideTransition(
          direction: AxisDirection.right, page: const CompleteProfileScreen());

    default:
      return null;
  }
}
