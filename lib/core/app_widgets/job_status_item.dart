import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/app_images.dart';
import 'package:jobsque/core/utils/styles.dart';

class JobStatusItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isAccepted;

  const JobStatusItem(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.isAccepted})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: AppTheme.primary1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              color: const Color(0xFF6690FF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: SvgPicture.asset(AppImages.twitter)),
        title: Text(
          title,
          style: Styles.textStyle13.copyWith(
              color: const Color(0xFF222741), fontWeight: FontWeight.w500),
        ),
        subtitle: Text('Waiting to be selected by the twitter team',
            style: Styles.textStyle10()),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: ShapeDecoration(
            color: isAccepted ? AppTheme.success3 : AppTheme.primary2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Text(isAccepted ? 'Accepted' : 'Submited',
              style: Styles.textStyle10(
                color: isAccepted ? AppTheme.success8 : AppTheme.primary7,
              )),
        ),
      ),
    );
  }
}
