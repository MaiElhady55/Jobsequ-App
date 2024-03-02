import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/home/data/models/suggested_job_model/data.dart';
import 'package:jobsque/features/home/presentation/views/widgets/job_feature.dart';
import 'package:sizer/sizer.dart';

class SuggestedJobListViewItem extends StatelessWidget {
  final Animation<double> animation;
  final Data? jobData;

  const SuggestedJobListViewItem(
      {super.key, required this.animation, required this.jobData});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: Offset(animation.value * 25, 0),
        child: Container(
          height: 56.h,
          width: 82.w,
          // width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: ShapeDecoration(
            color: AppTheme.primary9,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                leading: Container(
                    width: 40,
                    height: 40,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Image.network(jobData?.image!??"")),
                title: Text(jobData?.name??'',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle15.copyWith(color: Colors.white)),
                subtitle: Row(
                  children: [
                    Text(jobData?.compName??'',
                        style: Styles.textStyle14.copyWith(fontSize: 10)),
                    Expanded(
                      child: Text("• ${jobData?.location!}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle14.copyWith(fontSize: 10)),
                    ),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.archive_minus,
                      color: AppTheme.danger2),
                ),
                contentPadding: EdgeInsets.zero,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  JobFeature(
                    text: jobData?.jobTimeType ?? '',
                    color: Colors.white.withOpacity(0.14000000059604645),
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    width: 2.h,
                  ),
                  JobFeature(
                      text: jobData?.jobType ?? '',
                      color: Colors.white.withOpacity(0.14000000059604645),
                      textColor: Colors.white),
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: '\$${jobData?.salary ?? ''}',
                            style: Styles.textStyle20
                                .copyWith(color: Colors.white)),
                        TextSpan(
                            text: '/Month',
                            style: Styles.textStyle12.copyWith(
                              color: Colors.white.withOpacity(0.5),
                            )),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, AppRoute.jobDetailsScreen,
                      //  arguments: jobData);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary5,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000), // <-- Radius
                      ),
                    ),
                    child: Text("Apply now",
                        style: Styles.textStyle10(
                          color: Colors.white,
                        ).copyWith(fontWeight: FontWeight.w500)),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
