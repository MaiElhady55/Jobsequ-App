import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class JobFeature extends StatefulWidget {
  final String text;
  final Color color;
  final Color textColor;
  final void Function()? onTap;
  const JobFeature(
      {super.key,
      required this.text,
      this.color = AppTheme.primary1,
      this.textColor = AppTheme.primary5,
      this.onTap});

  @override
  State<JobFeature> createState() => _JobFeatureState();
}

class _JobFeatureState extends State<JobFeature> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 3.5.h,
      decoration: ShapeDecoration(
        color: widget.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Center(
        child: Text(widget.text,
            style: Styles.textStyle10(
              color: widget.textColor,
            )),
      ),
    );
  }
}
