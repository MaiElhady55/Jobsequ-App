import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/app_widgets/snack_bar.dart';
import 'package:jobsque/core/constance/constance.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/features/apply_job/presentation/view_models/cubit/job_cubit.dart';
import 'package:jobsque/features/apply_job/presentation/views/biodata_screen.dart';
import 'package:jobsque/features/apply_job/presentation/views/type_of_work_screen.dart';
import 'package:jobsque/features/apply_job/presentation/views/upload_portfolio_screen.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/stepper_indicator.dart';
import 'package:jobsque/features/home/data/models/job_model/data.dart';
import 'package:sizer/sizer.dart';

class ApplyJobScreen extends StatefulWidget {
  final JobData jobData;
  const ApplyJobScreen({super.key, required this.jobData});

  @override
  State<ApplyJobScreen> createState() => _ApplyJobScreenState();
}

class _ApplyJobScreenState extends State<ApplyJobScreen> {
  late PageController _pageController;
  late JobCubit cubit;

  @override
  void dispose() {
    // _pageController.dispose();
    usernameController.text = '';
    emailController.text = '';
    phoneController.text = '';
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    cubit = JobCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    print('currentSeppppp ${cubit.currentStep}');
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              if (cubit.currentStep == 0) {
                cubit.currentStep = 0;
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoute.layoutScreen, (route) => false);
              } else {
                cubit.minusStep();
                _pageController.animateToPage(cubit.currentStep,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate);
              }
            },
            icon: const Icon(Iconsax.arrow_left),
          ),
          title: Text('Apply Job',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SFProDisplay',
                  color: AppTheme.neutral9)),
          centerTitle: true,
        ),
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.33,
                  width: MediaQuery.of(context).size.width,
                  child: BlocBuilder<JobCubit, JobState>(
                    builder: (context, state) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StepIndication(
                              1,
                              "Bio Data",
                              cubit.currentStep >= 0,
                            ),
                            StepIndication(
                              2,
                              'Type of work',
                              cubit.currentStep >= 1,
                            ),
                            StepIndication(
                                3, 'Upload portfolio', cubit.currentStep == 2,
                                lineState: false),
                          ]);
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1.2,
                  child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (int i) {
                        //FocusScope.of(context).requestFocus(FocusNode());

                        cubit.currentStep = i;
                      },
                      children: [
                        BioDataScreen(),
                        const TypeOfWorkScreen(),
                        const UploadPortfolioScreen()
                      ]),
                ),
                SizedBox(
                  height: 3.h,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: BlocConsumer<JobCubit, JobState>(
                listener: (context, state) {
                  if (state is ApplyJobSuccessState) {
                    showSuccessSnackBar(
                        context: context, message: 'Job Applied Successfully');

                    Navigator.pushNamed(
                        context, AppRoute.applyJobSuccessfullyScreen);
                    cubit.currentStep = 0;
                  } else if (state is ApplyJobErrorState) {
                    showErrorSnackBar(
                        context: context,
                        message:
                            'There is something went wrong.Please Check You Selected Your CV and Other File');
                  }
                },
                builder: (context, state) {
                  if (state is! ApplyJobLoadingState) {
                    return CustomMainButton(
                        onPressed: () {
                          if (cubit.currentStep < 2) {
                            if (formKey.currentState?.validate() ?? true) {
                              cubit.addStep();
                              _pageController.animateToPage(cubit.currentStep,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.decelerate);
                            }
                          } else {
                            cubit.applyJob(
                                usernameController.text,
                                emailController.text,
                                phoneController.text,
                                widget.jobData.id.toString());
                          }
                        },
                        text: cubit.currentStep < 2 ? 'Next' : 'Submit');
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
        ]));
  }
}
