import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';

class ContactUsContainer extends StatelessWidget {
  final String title;
  final String textData;

  const ContactUsContainer(
      {super.key, required this.title, required this.textData});
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 8.h,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppTheme.neutral2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: Styles.textStyle10(
                color: AppTheme.neutral4,
              )),
          const SizedBox(height: 2),
          Text(textData,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle11.copyWith(
                color: AppTheme.neutral9,
              )),
        ],
      ),
    );
  }
}
