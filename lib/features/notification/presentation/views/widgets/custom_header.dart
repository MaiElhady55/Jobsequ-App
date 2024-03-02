import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';


class CustomHeader extends StatelessWidget {
  final String header;
  final bool isCentered;
  const CustomHeader(this.header, {super.key, this.isCentered = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: const ShapeDecoration(
        color: AppTheme.neutral1,
        shape: RoundedRectangleBorder(
          side: BorderSide( color: AppTheme.neutral2),
        ),
      ),
      child: Row(
        mainAxisAlignment:
        isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Text(header,
              style:  Styles.textStyle12.copyWith(color: AppTheme.neutral5,))
        ],
      ),
    );
  }
}