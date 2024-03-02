import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/constance/enums.dart';
import 'package:jobsque/core/network/local/cache_helper.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                style: Styles.textStyle19,
                textAlign: TextAlign.start,
                'Hi, ${CachHelper.getData(key: MySharedKeys.name.toString())} 👋',
              ),
              SizedBox(height: 2.h),
              Text('Create a better future for yourself here',
                  style: Styles.textStyle11.copyWith(color: AppTheme.neutral5)),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        Container(
            width: 50,
            height: 50,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: AppTheme.neutral3),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.notificationScreen);
                  },
                  icon: const Icon(Iconsax.notification)),
            )),
      ],
    );
  }
}
