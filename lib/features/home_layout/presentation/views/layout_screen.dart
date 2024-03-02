import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/home_layout/presentation/view_models/cubit/layout_cubit.dart';
import 'package:sizer/sizer.dart';

class layoutScreen extends StatefulWidget {
  const layoutScreen({super.key});

  @override
  State<layoutScreen> createState() => _layoutScreenState();
}

class _layoutScreenState extends State<layoutScreen> {
  late LayoutCubit cubit;
  @override
  void initState() {
    cubit = LayoutCubit.get(context);
    cubit.onPageChange(0);
    cubit.getCompleteProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: cubit.pages[cubit.currentIndex],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          return BottomNavigationBar(
            selectedItemColor: AppTheme.primary5,
            selectedLabelStyle: Styles.textStyle9,
            selectedIconTheme: const IconThemeData(color: AppTheme.primary5),
            unselectedItemColor: AppTheme.neutral4,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            onTap: (value) {
              cubit.onPageChange(value);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  Iconsax.home,
                ),
                activeIcon: const Icon(
                  Iconsax.home_15,
                ),
                label: cubit.titles[0],
              ),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Iconsax.message,
                  ),
                  activeIcon: const Icon(
                    Iconsax.message5,
                  ),
                  label: cubit.titles[1]),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Iconsax.briefcase,
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.fromLTRB(3.h, 0, 0, 0),
                    child: const Icon(
                      Iconsax.briefcase5,
                    ),
                  ),
                  label: cubit.titles[2]),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Iconsax.archive_minus,
                  ),
                  activeIcon: Padding(
                    padding: EdgeInsets.fromLTRB(3.h, 0, 0, 0),
                    child: const Icon(
                      Iconsax.archive_minus5,
                    ),
                  ),
                  label: cubit.titles[3]),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Iconsax.frame_1,
                  ),
                  activeIcon: const Icon(
                    Iconsax.frame5,
                  ),
                  label: cubit.titles[4]),
            ],
          );
        },
      ),
    );
  }
}
