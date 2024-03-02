import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/create_account/presentation/view_models/cubit/register_cubit.dart';
import 'package:sizer/sizer.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;

  const CustomTabBar({super.key, required this.tabController});
  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context);
    return Container(
      height: 6.h,
      decoration: const BoxDecoration(
        color: AppTheme.neutral1,
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
      ),
      child: TabBar(
          controller: tabController,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppTheme.primary9),
          splashBorderRadius: BorderRadius.circular(100),
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.white,
          labelStyle: Styles.textStyle11,
          unselectedLabelColor: AppTheme.neutral5,
          unselectedLabelStyle: Styles.textStyle11,
          onTap: (index) {
            cubit.changeIndex(index);
          },
          tabs: [
            Tab(
              text: "Work From Office",
            ),
            Tab(
              text: "Remote Work",
            )
          ]),
    );
  }
}
