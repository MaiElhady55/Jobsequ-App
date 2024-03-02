import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/message_screen/data/models/message_model.dart';
import 'package:sizer/sizer.dart';

class MessageItem extends StatelessWidget {
  final MessageModel messageModel;
  const MessageItem(this.messageModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.topLeft,
        children: [
          CircleAvatar(
              backgroundImage: NetworkImage(messageModel.img), radius: 21.sp),
          messageModel.status
              ? SizedBox()
              : Container(
                  width: 4.w,
                  height: 2.h,
                  decoration: ShapeDecoration(
                    color: AppTheme.primary5,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: Text('1',
                        style: Styles.textStyle16.copyWith(fontSize: 8)),
                  ),
                )
        ],
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(messageModel.name,
              style: Styles.textStyle12.copyWith(
                color: AppTheme.neutral9,
              )),
          Text(messageModel.datetime,
              style: Styles.textStyle10(
                color:
                    messageModel.status ? AppTheme.neutral5 : AppTheme.primary5,
              )),
        ],
      ),
      subtitle: Text(messageModel.message,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: Styles.textStyle10(
            color: AppTheme.neutral5,
          )),
      contentPadding: EdgeInsets.zero,
    );
  }
}
