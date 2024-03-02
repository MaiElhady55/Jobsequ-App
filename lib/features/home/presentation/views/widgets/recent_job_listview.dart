import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/shimmer/shimmer_recent_job.dart';
import 'package:jobsque/features/home/presentation/view_models/recent_jobs_cubit/recent_jobs_cubit.dart';
import 'package:jobsque/features/home/presentation/views/widgets/recent_job_listview_item.dart';

class RecentJobListView extends StatefulWidget {
  const RecentJobListView({super.key});

  @override
  State<RecentJobListView> createState() => _RecentJobListViewState();
}

class _RecentJobListViewState extends State<RecentJobListView> {
  // late HomeCubit cubit;
  late RecentJobsCubit recentJobsCubit;

  @override
  void initState() {
    super.initState();
    // cubit = HomeCubit.get(context);
    recentJobsCubit = RecentJobsCubit.get(context);
    recentJobsCubit.getAllRecentJob();
  }

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<HomeCubit, HomeState>(
    //   builder: (context, state) {
    //     if (state is GetAllRecenttJobsFailure) {
    //       return Center(
    //         child: Text(state.errMessage),
    //       );
    //     } else if (state is GetAllRecenttJobsSuccessfully) {
    //       return SizedBox(
    //         child: ListView.separated(
    //             physics: NeverScrollableScrollPhysics(),
    //             padding: EdgeInsets.zero,
    //             scrollDirection: Axis.vertical,
    //             shrinkWrap: true,
    //             itemBuilder: (context, index) => RecentJobListViewItem(
    //                   jobData: state.recentJobData[index],
    //                 ),
    //             separatorBuilder: (context, index) => Padding(
    //                   padding: const EdgeInsets.only(top: 10),
    //                   child: Divider(),
    //                 ),
    //             itemCount: state.recentJobData.length),
    //       );
    //     } else if(state is GetAllRecenttJobsLoading) {
    //       return ShimmerRecentlyListView();
    //     }
    //     return Text('Something happend');
    //   },
    // );
    return BlocBuilder<RecentJobsCubit, RecentJobsState>(
      builder: (context, state) {
        if (state is GetAllRecenttJobsFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is GetAllRecenttJobsSuccessfully) {
          print('SUCCESS');
          return SizedBox(
            child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) => RecentJobListViewItem(
                      jobData: state.recentJobData[index],
                    ),
                separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Divider(),
                    ),
                itemCount: state.recentJobData.length),
          );
        } else {
          print('Loading');
          return ShimmerRecentlyListView();
        }
      },
    );
  }
}
