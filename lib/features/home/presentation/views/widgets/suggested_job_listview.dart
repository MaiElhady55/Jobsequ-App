import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/shimmer/shimmer_suggested_job.dart';
import 'package:jobsque/features/home/presentation/view_models/suggested_jobs_cubit/suggested_jobs_cubit_cubit.dart';
import 'package:jobsque/features/home/presentation/views/widgets/suggested_job_listview_item.dart';
import 'package:sizer/sizer.dart';

class SuggestedJobListView extends StatefulWidget {
  const SuggestedJobListView({super.key});

  @override
  State<SuggestedJobListView> createState() => _SuggestedJobListViewState();
}

class _SuggestedJobListViewState extends State<SuggestedJobListView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late SuggestedJobsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = SuggestedJobsCubit.get(context);
    cubit.getAllSuggestedJob();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<HomeCubit, HomeState>(
    //   builder: (context, state) {
    //     if (state is GetAllSuggestJobsFailure) {
    //       print('fAILURE');
    //       return Center(
    //         child: Text(state.errMessage),
    //       );
    //     } else if (state is GetAllSuggestJobsSuccessfully) {
    //       print('SUCCESS');
    //       return SizedBox(
    //         height: 200,
    //         child: ListView.separated(
    //             scrollDirection: Axis.horizontal,
    //             shrinkWrap: true,
    //             itemBuilder: (context, index) => AnimatedBuilder(
    //                   animation: _animation,
    //                   builder: (BuildContext context, Widget? child) {
    //                     return SuggestedJobListViewItem(
    //                       animation: _animation,
    //                       jobData: state.suggestedJobModel.data,
    //                     );
    //                   },
    //                 ),
    //             separatorBuilder: (context, index) => SizedBox(
    //                   width: 4.w,
    //                 ),
    //             itemCount: 3 //cubit.suggestJobsData.length
    //             ),
    //       );
    //     }
    //     print('LOADING');
    //     return ShimmerSuggestedJob();
    //   },
    // );
    return BlocBuilder<SuggestedJobsCubit, SuggestedJobsState>(
      builder: (context, state) {
        if (state is GetAllSuggestJobsFailure) {
          print('Failure');
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is GetAllSuggestJobsSuccessfully) {
          print('SUCCESS');
          return SizedBox(
            height: 200,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) => AnimatedBuilder(
                      animation: _animation,
                      builder: (BuildContext context, Widget? child) {
                        return SuggestedJobListViewItem(
                          animation: _animation,
                          jobData: state.suggestedJobModel.data,
                        );
                      },
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      width: 4.w,
                    ),
                itemCount: 3
                ),
          );
        } else {
          print('Loading');
          return ShimmerSuggestedJob();
        }
      },
    );
  }
}
