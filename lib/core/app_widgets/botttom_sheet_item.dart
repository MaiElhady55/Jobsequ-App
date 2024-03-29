import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';

class BottomSheetItem extends StatelessWidget {
  final String actionName;
  final IconData? actionIcon;
  final bool hasIcon;
  final void Function()? onTap;
  const BottomSheetItem(this.actionName, {super.key,this.actionIcon,  this.hasIcon=true, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide( color: AppTheme.neutral3),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: hasIcon? Icon(
              actionIcon,
              size: 20.0,
            ): null,
            title: Text(
              actionName,
              style:  Styles.textStyle13.copyWith(color: AppTheme.neutral9,)
            ),
            trailing: const Icon(
              Iconsax.arrow_right_3,
              size: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}