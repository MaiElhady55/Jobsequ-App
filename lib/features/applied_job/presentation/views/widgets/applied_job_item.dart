import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/applied_job/presentation/view_models/cubit/applied_job_cubit.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/stepper_indicator.dart';
import 'package:jobsque/features/home/data/models/job_model/data.dart';
import 'package:jobsque/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:jobsque/features/home/presentation/views/widgets/job_feature.dart';
import 'package:sizer/sizer.dart';

class AppliedJobItem extends StatefulWidget {
  const AppliedJobItem({Key? key, required this.jobData}) : super(key: key);

  final JobData jobData;

  @override
  State<AppliedJobItem> createState() => _AppliedJobItemState();
}

class _AppliedJobItemState extends State<AppliedJobItem> {
  int currentStep = 2;
  late AppliedJobCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = AppliedJobCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              style: Styles.textStyle15.copyWith(
                color: AppTheme.neutral9,
              )),
          subtitle: Row(
            children: [
              Text(widget.jobData.compName!,
                  style: Styles.textStyle10(
                    color: AppTheme.neutral7,
                  )),
              Expanded(
                child: Text("• ${widget.jobData.location!}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle10(
                      color: AppTheme.neutral7,
                    )),
              ),
            ],
          ),
          trailing: BlocConsumer<HomeCubit, HomeState>(
            //  listenWhen: (previous, current) => previous != current,
            listener: (context, state) {
              print('stated updated: $state');
            },
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  //  cubit.addFavourite(widget.jobData.id.toString());
                  HomeCubit.get(context).handleFavourite(widget.jobData);
                },
                icon: HomeCubit.get(context).checkFavourite(widget.jobData.id!)
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
              text: widget.jobData.jobTimeType!,
            ),
            SizedBox(
              width: 2.h,
            ),
            JobFeature(
              text: widget.jobData.jobType!,
            ),
            const Spacer(),
            Column(
              children: [
                Text('Posted 2 days ago',
                    // textAlign: TextAlign.right,
                    style: Styles.textStyle10(
                      color: AppTheme.neutral7,
                    ))
              ],
            )
          ],
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height * 0.10,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xFFD1D5DB)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            StepIndication(
              1,
              "Bio Data",
              currentStep >= 0,
              raduis: 4.h,
            ),
            StepIndication(
              2,
              'Type of work',
              currentStep >= 1,
              raduis: 4.h,
            ),
            StepIndication(
              3,
              'Upload portfolio',
              currentStep >= 2,
              lineState: false,
              raduis: 4.h,
            ),
          ]),
        ),
      ],
    );
  }
}
