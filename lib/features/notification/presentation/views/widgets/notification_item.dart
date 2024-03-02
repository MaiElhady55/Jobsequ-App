import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/notification/data/models/notification_model.dart';
import 'package:sizer/sizer.dart';



class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  const NotificationItem(this.notification, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundImage: NetworkImage(notification.img), radius: 21.sp),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            notification.company,
            style:  Styles.textStyle12.copyWith(color: AppTheme.neutral9)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              notification.status
                  ? Container()
                  : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 3.w,
                  height: 1.h,
                  decoration: const BoxDecoration(
                    color: AppTheme.warning6,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text(
                notification.datetime,
                style:  Styles.textStyle10(color: AppTheme.neutral5)
              )
            ],
          ),
        ],
      ),
      subtitle: Text(
        notification.subtitle,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style:  Styles.textStyle10(color: AppTheme.neutral5)
      ),
        contentPadding:EdgeInsets.zero,

    );
  }
}