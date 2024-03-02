import 'package:flutter/material.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/features/applied_job/presentation/view_models/cubit/applied_job_cubit.dart';
import 'package:jobsque/features/applied_job/presentation/views/applied_job_active_screen.dart';
import 'package:jobsque/features/applied_job/presentation/views/applied_job_rejected_screen.dart';
import 'package:jobsque/features/applied_job/presentation/views/widgets/menu_bar.dart';

class AppliedJobScreen extends StatefulWidget {
  const AppliedJobScreen({super.key});

  @override
  State<AppliedJobScreen> createState() => _AppliedJobScreenState();
}

class _AppliedJobScreenState extends State<AppliedJobScreen> {
  late AppliedJobCubit cubit;

  @override
  void initState() {
    cubit=AppliedJobCubit.get(context);
    cubit.getAppliedJobsId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
      appBar: customAppBar("Applied Job", context, leading: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: MenuBarAppliedJob(
              pageController: pageController,
            ),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [
                AppliedJobActiveScreen(),
                AppliedJobRejectedScreen()
              ],
              onPageChanged: (index) {
                AppliedJobCubit.get(context).changeIndex(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
