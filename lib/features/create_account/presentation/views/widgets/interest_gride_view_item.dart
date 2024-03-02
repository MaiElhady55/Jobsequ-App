import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/create_account/presentation/view_models/cubit/register_cubit.dart';
import 'package:sizer/sizer.dart';

class IntresetGrideViewItem extends StatefulWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;

  const IntresetGrideViewItem(
      {super.key, required this.text, required this.icon, this.onTap});

  @override
  State<IntresetGrideViewItem> createState() => _IntresetGrideViewItemState();
}

class _IntresetGrideViewItemState extends State<IntresetGrideViewItem> {
  late RegisterCubit cubit;

  @override
  void initState() {
    cubit = RegisterCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (cubit.interestedWork.contains(widget.text)) {
          cubit.deleteItem(widget.text);
        } else {
          cubit.addItem(widget.text);
        }
        print(cubit.interestedWork);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        decoration: ShapeDecoration(
          color: cubit.interestedWork.contains(widget.text)
              ? AppTheme.primary5.withOpacity(0.3)
              : AppTheme.neutral3.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 0.5,
                color: cubit.interestedWork.contains(widget.text)
                    ? AppTheme.primary5
                    : const Color(0xFFFAFAFA)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
                color: cubit.interestedWork.contains(widget.text)
                    ? Colors.white
                    : AppTheme.neutral3.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: cubit.interestedWork.contains(widget.text)
                          ? AppTheme.primary5
                          : AppTheme.neutral3),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Icon(
                widget.icon,
                color: cubit.interestedWork.contains(widget.text)
                    ? AppTheme.primary5
                    : const Color(0xFF292D32),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Flexible(
              child: Text(widget.text,
                  style: Styles.textStyle16.copyWith(color: AppTheme.neutral9)),
            )
          ],
        ),
      ),
    );
  }
}
