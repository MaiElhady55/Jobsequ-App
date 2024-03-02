import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/animations/slide_transition_animation.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/core/app_widgets/snack_bar.dart';
import 'package:jobsque/core/constance/enums.dart';
import 'package:jobsque/core/network/local/cache_helper.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/features/notification/presentation/views/widgets/custom_header.dart';
import 'package:jobsque/features/profile/presentation/view_models/cubit/profile_cubit.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/general_data.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/others_data.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/personal_details.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = ProfileCubit.get(context)..loadSavedProfileImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(
        'Profile',
        context,
        leading: false,
        actions: [
          IconButton(
            onPressed: () {
              
              CachHelper.removeData(key: MySharedKeys.token.toString()).then((value) => CachHelper.removeData(key: MySharedKeys.completeProfile.toString()))
                  .then((value) {
                // cubit.close();
                //  HomeCubit.get(context).close();
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoute.loginScreen, (route) => false);
                showSuccessSnackBar(
                    context: context, message: 'Logged out Successfully');
              });
            },
            icon: const Icon(
              Iconsax.logout_1,
              color: Colors.red,
            ),
          )
        ],
        backgroundColor: AppTheme.primary1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SlideTransitionAnimation(
              duration: Duration(seconds: 1),
              begin: Offset(0, 0.2),
              end: Offset.zero,
              child: ProfileHeader(),
            ),
            const SlideTransitionAnimation(
                duration: Duration(seconds: 1),
                begin: Offset(0, 0.2),
                end: Offset.zero,
                child: ProfilePersonalDetails()),
            const CustomHeader('General'),
            SizedBox(
              height: 1.h,
            ),
            const GeneralDataListTile(),
            const CustomHeader('Others'),
            const OtherDataListTile()
          ],
        ),
      ),
    );
  }
}
