import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class JobDetailsPeopleTile extends StatelessWidget {
  JobDetailsPeopleTile(
      {Key? key,
      required this.image,
      required this.name,
      required this.job,
      required this.yearsOfExp})
      : super(key: key);
  final String image;
  final String name;
  final String job;
  final String yearsOfExp;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(image, width: 5.h, height: 5.h),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name,
              style: Styles.textStyle11.copyWith(
                color: AppTheme.neutral9,
              )),
          Text('Work during',
              style: Styles.textStyle10(
                color: AppTheme.neutral5,
              ))
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(job,
              style: Styles.textStyle10(
                color: AppTheme.neutral5,
              )),
          Text(yearsOfExp, style: Styles.textStyle10(color: AppTheme.primary5)),
        ],
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
