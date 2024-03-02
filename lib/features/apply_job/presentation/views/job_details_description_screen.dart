import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/home/data/models/job_model/data.dart';
import 'package:sizer/sizer.dart';

class JobDetailsDescriptionScreen extends StatelessWidget {
  final JobData jobData;

  const JobDetailsDescriptionScreen({super.key, required this.jobData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Job Description',
              style: Styles.textStyle11.copyWith(color: AppTheme.neutral9)
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              jobData.jobDescription!,
              textAlign: TextAlign.justify,
              style: Styles.textStyle10(color: AppTheme.neutral6,)
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Skill Required',
              style: Styles.textStyle11.copyWith(color: AppTheme.neutral9)
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(jobData.jobSkill!,
                textAlign: TextAlign.justify,
                style: Styles.textStyle10(color: AppTheme.neutral6))
          ],
        ),
      ),
    );
  }
}
