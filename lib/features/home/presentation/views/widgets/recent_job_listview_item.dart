import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/home/data/models/job_model/data.dart';
import 'package:jobsque/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:jobsque/features/home/presentation/views/widgets/job_feature.dart';
import 'package:sizer/sizer.dart';

class RecentJobListViewItem extends StatefulWidget {
  final JobData jobData;

  const RecentJobListViewItem({super.key, required this.jobData});

  @override
  State<RecentJobListViewItem> createState() => _RecentJobListViewItemState();
}

class _RecentJobListViewItemState extends State<RecentJobListViewItem> {
  late HomeCubit homeCubit;
  @override
  void initState() {
    homeCubit = HomeCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.jobDetailsScreen,
            arguments: widget.jobData);
      },
      child: Column(children: [
        ListTile(
          leading: Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                color: const Color(0xFF6690FF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Image.network(widget.jobData.image!)),
          title: Text(widget.jobData.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle15.copyWith(
                color: AppTheme.neutral9,
              )),
          subtitle: Row(
            children: [
              Text(widget.jobData.compName!,
                  style: Styles.textStyle14
                      .copyWith(fontSize: 10)
                      .copyWith(color: AppTheme.neutral7)),
              Expanded(
                child: Text("• ${widget.jobData.location!}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle14.copyWith(fontSize: 10).copyWith(
                          color: AppTheme.neutral7,
                        )),
              ),
            ],
          ),
          trailing: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              print('stated updated: $state');
            },
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  homeCubit.handleFavourite(widget.jobData);
                },
                icon: homeCubit.checkFavourite(widget.jobData.id!)
                    ? Transform.translate(
                        offset: Offset(1.5.h, 0),
                        child: const Icon(
                          Iconsax.archive_minus5,
                          color: AppTheme.primary5,
                        ))
                    : const Icon(
                        Iconsax.archive_minus,
                      ),
              );
            },
          ),
          contentPadding: EdgeInsets.zero,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            JobFeature(
              text: widget.jobData.jobTimeType ?? "",
            ),
            SizedBox(
              width: 2.h,
            ),
            // const JobFeature(text: "Remote",),
            JobFeature(
              text: widget.jobData.jobType ?? '',
            ),
            const Spacer(),

            Column(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '\$${widget.jobData.salary ?? ''}',
                          style: Styles.textStyle13.copyWith(
                              color: AppTheme.success7,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: '/Month',
                          style: Styles.textStyle10(color: AppTheme.neutral5)
                              .copyWith(fontWeight: FontWeight.w500)),
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
