import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/apply_job/presentation/view_models/cubit/job_cubit.dart';
import 'package:sizer/sizer.dart';

class UploadFile extends StatefulWidget {
  final String target;

  const UploadFile({super.key, required this.target});

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  late JobCubit cubit;
  @override
  void initState() {
    cubit = JobCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        cubit.pickFile(target: widget.target);
      },
      child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(8),
          dashPattern: [8, 5],
          color: AppTheme.primary5,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
                color: AppTheme.primary1.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Container(
                  width: 17.w,
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: AppTheme.primary1,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Iconsax.document_upload5,
                      color: AppTheme.primary5,
                      size: 27.sp,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                    widget.target == 'CV'
                        ? 'Upload your CV'
                        : 'Upload your other file',
                    style: Styles.textStyle15.copyWith(
                      color: AppTheme.neutral9,
                    )),
                SizedBox(height: 1.h),
                Text('Max. file size 1 MB',
                    style: Styles.textStyle10(
                      color: AppTheme.neutral5,
                    )),
                SizedBox(height: 3.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 5.5.h,
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: AppTheme.primary1,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: AppTheme.primary5),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Iconsax.export_1,
                          color: AppTheme.primary5,
                          size: 17.sp,
                        ),
                        const SizedBox(width: 10.0),
                        Text('Add file',
                            textAlign: TextAlign.center,
                            style: Styles.textStyle11.copyWith(
                              color: AppTheme.primary5,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
