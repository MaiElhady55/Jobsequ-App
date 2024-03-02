import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/profile/presentation/view_models/cubit/profile_cubit.dart';
import 'package:sizer/sizer.dart';

class UserAbout extends StatefulWidget {
  const UserAbout({super.key});

  @override
  State<UserAbout> createState() => _UserAboutState();
}

class _UserAboutState extends State<UserAbout> {
  late ProfileCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'About',
              style: Styles.textStyle13.copyWith(color: AppTheme.neutral5,)
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.editDetailsScreen);
                },
                child: Text(
                  'Edit',
                  style:Styles.textStyle11.copyWith(color: AppTheme.primary5,)
                ))
          ],
        ),
        SizedBox(height: 0.5.h),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if(cubit.profileDetails.isNotEmpty){
              return Text(
                cubit.profileDetails[0].bio??'add your Boi',
                style: Styles.textStyle11.copyWith(color: AppTheme.neutral5,)
              );
            }
            else {
              return const Center(child: CircularProgressIndicator());
            }

          },
        ),
      ],
    );
  }
}
