import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/shimmer/shimmer_circle_avatar_effect.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/profile/presentation/view_models/cubit/profile_cubit.dart';
import 'package:sizer/sizer.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  late ProfileCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = ProfileCubit.get(context)
      ..getProfileDetailsAndPortfolios()
      ..getProfileNameAndEmail();
  }

  @override
  Widget build(BuildContext context) {
    print(cubit.profile[0].name);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  color: AppTheme.primary1,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.18,
                  child: BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      if (state is GetImageLoading ||
                          state is PickImageLoading) {
                        return ShimmerCircleAvatarEffect(
                          radius: 44,
                        );
                      } else if (cubit.savedImage != null) {
                        return Container(
                            width: 90,
                            height: 90,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: FileImage(cubit.savedImage!),
                                fit: BoxFit.fill,
                              ),
                              shape: const OvalBorder(
                                side: BorderSide(width: 2, color: Colors.white),
                              ),
                            ));
                      } else {
                        return Container(
                            width: 90,
                            height: 90,
                            decoration: const ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.pngall.com/wp-content/uploads/5/Profile-PNG-Free-Download.png"),
                                fit: BoxFit.cover,
                              ),
                              shape: OvalBorder(
                                side: BorderSide(width: 2, color: Colors.white),
                              ),
                            ));
                      }
                    },
                  ),
                )
              ]),
        ),
        SizedBox(height: 5.h),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (cubit.profile.isNotEmpty) {
              return Text(cubit.profile[0].name ?? '',
                  style: Styles.textStyle16
                      .copyWith(color: AppTheme.neutral9, fontSize: 17));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        SizedBox(height: 0.2.h),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (cubit.profileDetails.isNotEmpty) {
              return Text(cubit.profileDetails[0].interestedWork ?? '',
                  style: Styles.textStyle12.copyWith(
                    color: AppTheme.neutral5,
                  ));
            } else {
              return const Center(child: Text(''));
            }
          },
        ),
        SizedBox(height: 2.h),
      ],
    );
  }
}
