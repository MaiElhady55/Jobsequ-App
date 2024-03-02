import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/apply_job/presentation/view_models/cubit/job_cubit.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/custom_text_rich.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/portfolio_item.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/upload_file.dart';
import 'package:sizer/sizer.dart';

class UploadPortfolioScreen extends StatefulWidget {
  const UploadPortfolioScreen({super.key});

  @override
  State<UploadPortfolioScreen> createState() => _UploadPortfolioScreenState();
}

class _UploadPortfolioScreenState extends State<UploadPortfolioScreen> {
  late JobCubit cubit;
  @override
  void initState() {
    cubit = JobCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Upload Portfolio',
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
              CustomTextRich(title: 'Upload CV'),
              SizedBox(height: 1.h),
              UploadFile(target: 'CV'),
              BlocBuilder<JobCubit, JobState>(
                builder: (context, state) {
                  return BuildCondition(
                    condition: cubit.selectedCVFile != null,
                    builder: (context) => CustomPortfolioItem(
                      text: cubit.selectedCVFile!.path.split('/').last,
                      size: ((cubit.selectedCVFile!.lengthSync()) / 1024 / 1024)
                          .toStringAsFixed(2),
                      selectedFile: cubit.selectedCVFile!,
                    ),
                    fallback: (context) => const SizedBox.shrink(),
                  );
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Text('Other File',
                  style: Styles.textStyle13.copyWith(
                    color: AppTheme.neutral9,
                  )),
              SizedBox(
                height: 1.h,
              ),
              const UploadFile(
                target: 'Other',
              ),
              BlocBuilder<JobCubit, JobState>(
                builder: (context, state) {
                  return BuildCondition(
                    condition: cubit.selectedOtherFile != null,
                    builder: (context) => CustomPortfolioItem(
                      text: cubit.selectedOtherFile!.path.split('/').last,
                      size: ((cubit.selectedOtherFile!.lengthSync()) /
                              1024 /
                              1024)
                          .toStringAsFixed(2),
                      isImage: true,
                      selectedFile: cubit.selectedOtherFile!,
                    ),
                    fallback: (context) => const SizedBox.shrink(),
                  );
                },
              ),
              SizedBox(height: 20.h),
            ])));
  }
}
