import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/onboarding/data/models/onboarding_model.dart';
import 'package:sizer/sizer.dart';

class BoardingItem extends StatelessWidget {
  final OnBoardingModel onBoardingModel;

  const BoardingItem({super.key, required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(
          onBoardingModel.image,
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.525,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: Container(child: onBoardingModel.title)),
        SizedBox(
          height: 0.5.h,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Center(
            child: Text(onBoardingModel.description, style: Styles.textStyle13
                //maxLines: 2,
                ),
          ),
        ),
      ],
    );
  }
}
