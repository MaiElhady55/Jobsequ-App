import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/shimmer/shimmer_applied_listview.dart';
import 'package:jobsque/features/applied_job/presentation/view_models/cubit/applied_job_cubit.dart';
import 'package:jobsque/features/applied_job/presentation/views/applies_not_found_screen.dart';
import 'package:jobsque/features/applied_job/presentation/views/widgets/applied_job_item.dart';
import 'package:jobsque/features/notification/presentation/views/widgets/custom_header.dart';

class AppliedJobActiveScreen extends StatefulWidget {
  const AppliedJobActiveScreen({super.key});

  @override
  State<AppliedJobActiveScreen> createState() => _AppliedJobActiveScreenState();
}

class _AppliedJobActiveScreenState extends State<AppliedJobActiveScreen> {
  late AppliedJobCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = AppliedJobCubit.get(context);
    cubit.getAppliedJobsId();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<AppliedJobCubit, AppliedJobState>(
            builder: (context, state) {
              return CustomHeader("${cubit.appliedJobsData.length} Jobs");
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: BlocBuilder<AppliedJobCubit, AppliedJobState>(
              builder: (context, state) {
                if (state is AppliedJobEmpty) {
                  return const AppliedScreenNotFound();
                }
               else if (cubit.appliedJobsData.isNotEmpty) {
                  return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => AppliedJobItem(
                            jobData: cubit.appliedJobsData[index],
                          ),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: cubit.appliedJobsData.length);
                } else {
                  return const ShimmerAppliedListView();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
