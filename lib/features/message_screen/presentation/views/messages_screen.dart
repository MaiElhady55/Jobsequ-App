import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_widgets/bottom_sheet_savedjob.dart';
import 'package:jobsque/core/app_widgets/botttom_sheet_item.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:jobsque/features/message_screen/data/models/message_model.dart';
import 'package:jobsque/features/message_screen/presentation/views/widgets/message_item.dart';
import 'package:sizer/sizer.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: customAppBar("Messages", context, leading: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomSearchBar(
                      controller: searchController,
                      hintText: 'Search messages....',
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  InkWell(
                    onTap: () {
                      Scaffold.of(context).showBottomSheet<void>(
                        (BuildContext ctx) => const CustomBottomSheet(
                          items: [
                            BottomSheetItem(
                              'Unread',
                              hasIcon: false,
                            ),
                            BottomSheetItem(
                              'Spam',
                              hasIcon: false,
                            ),
                            BottomSheetItem(
                              'Archived',
                              hasIcon: false,
                            ),
                          ],
                          isTitled: true,
                          text: 'Message filters',
                        ),
                      );
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.all(12),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: AppTheme.neutral3),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: const Icon(Iconsax.setting_4),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) =>
                    MessageItem(messages[index]),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
