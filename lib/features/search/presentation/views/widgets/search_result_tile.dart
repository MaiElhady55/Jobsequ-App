import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/constance/enums.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class SearchResultTile extends StatelessWidget {
  final String tile;
  final SearchType searchType;
  const SearchResultTile(this.tile, this.searchType, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        searchType == SearchType.recent ? Iconsax.clock : Iconsax.search_status,
        size: 13.5.sp,
        color: AppTheme.neutral9,
      ),
      title: Text(tile,
          style: Styles.textStyle11.copyWith(
            color: AppTheme.neutral9,
          )),
      trailing: Icon(
        searchType == SearchType.recent
            ? Iconsax.close_circle
            : Iconsax.arrow_right_2,
        size: 18.5.sp,
        color: searchType == SearchType.recent
            ? AppTheme.danger5
            : AppTheme.primary5,
      ),
    );
  }
}
