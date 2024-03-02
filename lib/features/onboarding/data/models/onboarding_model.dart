import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/app_images.dart';
import 'package:jobsque/core/utils/styles.dart';

class OnBoardingModel {
  final String image;
  final Text title;
  final String description;

  OnBoardingModel(
      {required this.image, required this.title, required this.description});

  static List<OnBoardingModel> boardingData = [
    OnBoardingModel(
        image: AppImages.board1,
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Find a job, and ",
                style: Styles.textStyle27,
              ),
              TextSpan(
                  text: "start building ",
                  style: Styles.textStyle27.copyWith(color: AppTheme.primary5)),
              TextSpan(
                  text: " your career from now on", style: Styles.textStyle27),
            ],
          ),
        ),
        description:
            'Explore over 25,924 available job roles and upgrade your operator now.'),
    OnBoardingModel(
        image: AppImages.board2,
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: "Hundreds of jobs are waiting for you to  ",
                  style: Styles.textStyle27),
              TextSpan(
                  text: "join together ",
                  style: Styles.textStyle27.copyWith(color: AppTheme.primary5)),
            ],
          ),
        ),
        description:
            "Immediately join us and start applying for the job you are interested in."),
    OnBoardingModel(
        image: AppImages.board3,
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "Get the best ", style: Styles.textStyle27),
              TextSpan(
                  text: "choice for the job ",
                  style: Styles.textStyle27.copyWith(color: AppTheme.primary5)),
              TextSpan(
                  text: "you've always dreamed of", style: Styles.textStyle27),
            ],
          ),
        ),
        description:
            "The better the skills you have, the greater the good job opportunities for you."),
  ];
}
