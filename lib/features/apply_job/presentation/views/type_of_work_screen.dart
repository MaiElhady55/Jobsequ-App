import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/apply_job/presentation/view_models/cubit/job_cubit.dart';
import 'package:sizer/sizer.dart';

class TypeOfWorkScreen extends StatefulWidget {
  const TypeOfWorkScreen({super.key});

  @override
  State<TypeOfWorkScreen> createState() => _TypeOfWorkScreenState();
}

class _TypeOfWorkScreenState extends State<TypeOfWorkScreen> {
  late JobCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = JobCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Type Of Work',
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
          Column(
            children: cubit.typeOfWorkTiles,
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
