import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/core/animations/scale_transition_animation.dart';
import 'package:jobsque/core/constance/enums.dart';
import 'package:jobsque/core/network/local/cache_helper.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_images.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  Timer? _timer;
  @override
  void initState() {
    Timer(const Duration(milliseconds: 1300), () {
      String? token = CachHelper.getData(key: MySharedKeys.token.toString());
      print('Token $token');
      final onBoarding =
          CachHelper.getData(key: MySharedKeys.onboarding.toString());
      print('onBoarding $onBoarding');
      final rememberMe =
          CachHelper.getData(key: MySharedKeys.rememberMe.toString());

      if (token != null && token.isNotEmpty) {
        if (rememberMe == 'true') {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoute.layoutScreen, (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoute.loginScreen, (route) => false);
        }
      } else {
        if (onBoarding == null || onBoarding == 'false') {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoute.onBoardingScreen, (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoute.loginScreen, (route) => false);
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            AppImages.background,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          ScaleTransitionAnimation(
            duration: const Duration(seconds: 1),
            child: SvgPicture.asset(AppImages.logo),
          ),
        ],
      ),
    );
  }
}
