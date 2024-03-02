import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/animations/slide_transition_animation.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/apply_job/presentation/view_models/cubit/job_cubit.dart';
import 'package:jobsque/features/apply_job/presentation/views/job_details_company_screen.dart';
import 'package:jobsque/features/apply_job/presentation/views/job_details_description_screen.dart';
import 'package:jobsque/features/apply_job/presentation/views/job_details_pepole_screen.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/custom_menu_bar.dart';
import 'package:jobsque/features/home/data/models/job_model/data.dart';
import 'package:jobsque/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:jobsque/features/home/presentation/views/widgets/job_feature.dart';
import 'package:sizer/sizer.dart';

class JobDetailsScreen extends StatefulWidget {
  final JobData jobData;

  const JobDetailsScreen({super.key, required this.jobData});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  late HomeCubit homeCubit;
  PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // cubit = JobCubit.get(context);
    homeCubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobCubit(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return customAppBar("Job detail", context, actions: [
                IconButton(
                    onPressed: () {
                      homeCubit.handleFavourite(widget.jobData);
                    },
                    icon: homeCubit.checkFavourite(widget.jobData.id)
                        ? Transform.translate(
                            offset: Offset(1.5.h, 0),
                            child: const Icon(
                              Iconsax.archive_minus5,
                              color: AppTheme.primary5,
                            ),
                          )
                        : const Icon(
                            Iconsax.archive_minus,
                          )),
              ]);
            },
          ),
        ),
        body: Stack(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                width: 65.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      widget.jobData.image!,
                      width: 48,
                      height: 48,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(widget.jobData.name!,
                        textAlign: TextAlign.center,
                        style: Styles.textStyle16.copyWith(
                            color: AppTheme.neutral9, fontSize: 16.5)),
                    Text(
                        '${widget.jobData.compName} • ${widget.jobData.location} ',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle10()),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        JobFeature(
                          text: widget.jobData.jobTimeType!,
                        ),
                        JobFeature(
                          text: widget.jobData.jobType!,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: BlocBuilder<JobCubit, JobState>(
                  builder: (context, state) {
                    return CustomMenuBar(
                      pageController: pageController,
                    );
                  },
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SlideTransitionAnimation(
                      duration: const Duration(seconds: 1),
                      end: const Offset(0.2, 0),
                      begin: Offset.zero,
                      child: JobDetailsDescriptionScreen(
                        jobData: widget.jobData,
                      ),
                    ),
                    SlideTransitionAnimation(
                      duration: const Duration(seconds: 1),
                      end: const Offset(0.2, 0),
                      begin: Offset.zero,
                      child: JobDetailsCompanyScreen(
                        jobData: widget.jobData,
                      ),
                    ),
                    SlideTransitionAnimation(
                      duration: const Duration(seconds: 1),
                      end: const Offset(0.2, 0),
                      begin: Offset.zero,
                      child: JobDetailsPepoleScreen(),
                    ),
                  ],
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomMainButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoute.applyJobScreen,
                            arguments: widget.jobData);
                      },
                      text: "Apply now")),
            )
          ],
        ),
      ),
    );
  }
}
