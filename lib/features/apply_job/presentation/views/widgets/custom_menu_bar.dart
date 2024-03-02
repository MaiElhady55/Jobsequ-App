import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/apply_job/presentation/view_models/cubit/job_cubit.dart';
import 'package:sizer/sizer.dart';

class CustomMenuBar extends StatefulWidget {
  final PageController pageController;
  const CustomMenuBar({Key? key, required this.pageController})
      : super(key: key);

  @override
  State<CustomMenuBar> createState() => _CustomMenuBarState();
}

class _CustomMenuBarState extends State<CustomMenuBar> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobCubit(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 6.h,
        decoration: const BoxDecoration(
          color: AppTheme.neutral1,
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                onTap: () {
                  BlocProvider.of<JobCubit>(context).changeIndex(0);
                  widget.pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.h),
                  alignment: Alignment.center,
                  decoration:
                      (BlocProvider.of<JobCubit>(context).activeIndex == 0)
                          ? const BoxDecoration(
                              color: AppTheme.primary9,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.0)),
                            )
                          : null,
                  child: Text("Description",
                      style:
                          (BlocProvider.of<JobCubit>(context).activeIndex == 0)
                              ? Styles.textStyle11.copyWith(color: Colors.white)
                              : Styles.textStyle11.copyWith(
                                  color: AppTheme.neutral5,
                                )),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                onTap: () {
                  BlocProvider.of<JobCubit>(context).changeIndex(1);

                  widget.pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.h),
                  alignment: Alignment.center,
                  decoration:
                      (BlocProvider.of<JobCubit>(context).activeIndex == 1)
                          ? const BoxDecoration(
                              color: AppTheme.primary9,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.0)),
                            )
                          : null,
                  child: Text("Company",
                      style:
                          (BlocProvider.of<JobCubit>(context).activeIndex == 1)
                              ? Styles.textStyle11.copyWith(color: Colors.white)
                              : Styles.textStyle11.copyWith(
                                  color: AppTheme.neutral5,
                                )),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                onTap: () {
                  BlocProvider.of<JobCubit>(context).changeIndex(2);

                  widget.pageController.animateToPage(2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.h),
                  alignment: Alignment.center,
                  decoration:
                      (BlocProvider.of<JobCubit>(context).activeIndex == 2)
                          ? const BoxDecoration(
                              color: AppTheme.primary9,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.0)),
                            )
                          : null,
                  child: Text("Pepole",
                      style:
                          (BlocProvider.of<JobCubit>(context).activeIndex == 2)
                              ? Styles.textStyle11.copyWith(color: Colors.white)
                              : Styles.textStyle11.copyWith(
                                  color: AppTheme.neutral5,
                                )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
