import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/contuct_us_container.dart';
import 'package:jobsque/features/home/data/models/job_model/data.dart';
import 'package:sizer/sizer.dart';

class JobDetailsCompanyScreen extends StatelessWidget {
  final JobData jobData;

  const JobDetailsCompanyScreen({super.key, required this.jobData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Contact Us',
                style: Styles.textStyle11.copyWith(
                  color: AppTheme.neutral9,
                )),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Expanded(
                    child: ContactUsContainer(
                        title: 'Email', textData: jobData.compEmail ?? '')),
                SizedBox(
                  width: 4.w,
                ),
                Expanded(
                    child: ContactUsContainer(
                        title: 'Website', textData: jobData.compWebsite ?? ''))
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Text('About Company',
                style: Styles.textStyle11.copyWith(
                  color: AppTheme.neutral9,
                )),
            SizedBox(
              height: 2.h,
            ),
            Text(jobData.aboutComp!,
                textAlign: TextAlign.justify,
                style: Styles.textStyle10(
                  color: AppTheme.neutral6,
                ))
          ],
        ),
      ),
    );
  }
}
