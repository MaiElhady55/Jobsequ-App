import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/constance/enums.dart';
import 'package:jobsque/core/network/local/cache_helper.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_images.dart';
import 'package:jobsque/features/onboarding/data/models/onboarding_model.dart';
import 'package:jobsque/features/onboarding/presentation/views/view_models/cubit/onboarding_cubit.dart';
import 'package:jobsque/features/splash/presentation/views/widgets/boarding_item.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late OnboardingCubit cubit;

  @override
  void initState() {
    cubit = OnboardingCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: SvgPicture.asset(AppImages.logo),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2.h),
            child: TextButton(
                onPressed: () {
                  CachHelper.saveDate(
                          key: MySharedKeys.onboarding.toString(),
                          value: 'true')
                      .then((value) => Navigator.pushNamedAndRemoveUntil(
                          context, AppRoute.loginScreen, (route) => false));
                },
                child: const Text("Skip")),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: OnBoardingModel.boardingData.length,
                onPageChanged: (int index) => cubit.changePageView(index),
                controller: cubit.controller,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  OnBoardingModel onBoardingModel =
                      OnBoardingModel.boardingData[index];
                  return BoardingItem(onBoardingModel: onBoardingModel);
                },
              ),
            ),
            SmoothPageIndicator(
                controller: cubit.controller, // PageController
                count: OnBoardingModel.boardingData.length,
                effect: const SwapEffect(
                  type: SwapType.yRotation,
                  dotWidth: 8,
                  dotHeight: 8,
                ), // your preferred effect
                onDotClicked: (index) {}),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 6, 24, 20),
              child: BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  return CustomMainButton(
                      onPressed: () {
                        if (cubit.isLast) {
                          CachHelper.saveDate(
                                  key: MySharedKeys.onboarding.toString(),
                                  value: 'true')
                              .then((value) =>
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      AppRoute.loginScreen, (route) => false));
                        } else {
                          cubit.controller.nextPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeIn);
                        }
                      },
                      text: cubit.isLast ? "Get Started" : "Next");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
