import 'package:flutter/material.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/features/notification/data/models/notification_model.dart';
import 'package:jobsque/features/notification/presentation/views/notification_empty_screen.dart';
import 'package:jobsque/features/notification/presentation/views/widgets/custom_header.dart';
import 'package:jobsque/features/notification/presentation/views/widgets/notification_item.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmpty = false;
    return Scaffold(
      appBar: customAppBar('Notification', context),
      body: !isEmpty
          ? SingleChildScrollView(
          child: Column(
            children: [
              const CustomHeader('New'),
              SizedBox(height: 1.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: notifications.length,
                  itemBuilder: (BuildContext context, int index) =>
                      NotificationItem(notifications[index]),
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(indent: 24.0, endIndent: 24.0),
                ),
              ),
              const CustomHeader('Yesterday'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: yesterdayNotifications.length,
                  itemBuilder: (BuildContext context, int index) =>
                      NotificationItem(yesterdayNotifications[index]),
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(indent: 24.0, endIndent: 24.0),
                ),
              ),
            ],
          ))
          : const NotificationEmptyScreen(),
    );
  }
}
