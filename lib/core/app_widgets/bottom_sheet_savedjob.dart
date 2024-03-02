import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class CustomBottomSheet extends StatelessWidget {
  final List<Widget> items;
  final bool isTitled;
  final String? text;
  const CustomBottomSheet({super.key, required this.items,  this.isTitled=false,  this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      padding: const EdgeInsets.only(
        top: 12,
        left: 24,
        right: 24,
      ),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 6.0,
            width: MediaQuery.of(context).size.width*0.2,
            // padding: const EdgeInsets.all(14),
            decoration: ShapeDecoration(
              color: AppTheme.neutral8,
              shape: RoundedRectangleBorder(
                side: const BorderSide( color: AppTheme.neutral8),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
           SizedBox(height: 3.h),
          isTitled? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                text!,
                style: Styles.textStyle15.copyWith(color: AppTheme.neutral9,)
              ),
            ],
          ):SizedBox(),
          Column(
            children: items,
          )

        ],
      ),
    );
  }
}