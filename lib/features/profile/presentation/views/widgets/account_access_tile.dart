import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class CustomAccountAccessTile extends StatelessWidget {
  final String title;
  final String? trailingTitle;
  final void Function()? onTap;
  const CustomAccountAccessTile(
      {super.key, required this.title, this.trailingTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: Styles.textStyle13.copyWith(
                  color: AppTheme.neutral9,
                )),
            SizedBox(
              width: 5.w,
            ),
            trailingTitle != null
                ? Flexible(
                    child: SizedBox(
                      width: 150,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(trailingTitle!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: Styles.textStyle11.copyWith(
                                  color: AppTheme.neutral5,
                                )),
                          ),
                          const Icon(Iconsax.arrow_right_1)
                        ],
                      ),
                    ),
                  )
                : const Icon(Iconsax.arrow_right_1),
          ],
        ),
      ),
    );
  }
}
