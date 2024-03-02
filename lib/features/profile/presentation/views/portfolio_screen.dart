import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/app_widgets/snack_bar.dart';
import 'package:jobsque/core/constance/enums.dart';
import 'package:jobsque/core/network/local/cache_helper.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/portfolio_item.dart';
import 'package:jobsque/features/profile/presentation/view_models/cubit/profile_cubit.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/upload_file_experience.dart';
import 'package:sizer/sizer.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late ProfileCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Portfolio', context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Add portfolio here',
                      style: Styles.textStyle16
                          .copyWith(color: AppTheme.neutral9, fontSize: 16.5)),
                  SizedBox(height: 2.h),
                  const UploadFileExperience(
                    target: 'CV',
                  ),

                  //SizedBox(height: 1.h),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return BuildCondition(
                        condition: cubit.selectedCVFile != null,
                        builder: (context) => CustomPortfolioItem(
                          text: cubit.selectedCVFile!.path.split('/').last,
                          size: ((cubit.selectedCVFile!.lengthSync()) /
                                  1024 /
                                  1024)
                              .toStringAsFixed(2),
                          selectedFile: cubit.selectedCVFile!,
                        ),
                        fallback: (context) => const SizedBox.shrink(),
                      );
                    },
                  ),
                  SizedBox(height: 1.h),

                  //! Portfiolos List
                  // ListView.builder(
                  //     itemCount: cubit.portfolios.length,
                  //     shrinkWrap: true,
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     itemBuilder: (context, index) => CustomPortfolioItem(text: cubit.portfolios[index].cvFile!,
                  //       size: '200',
                  //        selectedFile: cubit.portfolios[index].image,
                  //
                  //     )),

                  SizedBox(height: 2.h),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is AddCVSuccessState) {
                    showSuccessSnackBar(
                        context: context,
                        message: 'Portfolio Updated Successfully');
                    Navigator.pop(context);
                  } else if (state is AddCVErrorState) {
                    showErrorSnackBar(
                        context: context,
                        message: 'There something wrong, Try Again');
                  }
                },
                builder: (context, state) {
                  return CustomMainButton(
                      isLoading: state is AddCVLoadingState,
                      onPressed: () {
                        print('CCCCVVVVV${cubit.selectedCVFile}');
                        if (cubit.selectedCVFile != null) {
                          cubit.addPortofolio();
                        }
                        if (CachHelper.getData(
                                key: MySharedKeys.completeProfile.toString()) ==
                            null) {
                          cubit.addItem('Portfolio');
                        }
                      },
                      text: 'Save');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
