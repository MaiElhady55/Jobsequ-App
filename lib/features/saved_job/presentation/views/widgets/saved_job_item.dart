import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/animations/slide_transition_animation.dart';
import 'package:jobsque/core/app_widgets/bottom_sheet_savedjob.dart';
import 'package:jobsque/core/app_widgets/botttom_sheet_item.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:jobsque/features/saved_job/data/models/favorite_data.dart';
import 'package:jobsque/features/saved_job/presentation/view_models/cubit/favourite_cubit.dart';
import 'package:sizer/sizer.dart';

class SavedJobItem extends StatefulWidget {
  final FavouriteData favouriteData;

  const SavedJobItem({super.key, required this.favouriteData});

  @override
  State<SavedJobItem> createState() => _SavedJobItemState();
}

class _SavedJobItemState extends State<SavedJobItem> {
  late HomeCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.network(widget.favouriteData.image!,
              width: 11.w, height: 5.h),
          title: Text(widget.favouriteData.jobs!.name!,
              style: Styles.textStyle15.copyWith(
                color: AppTheme.neutral9,
              )),
          subtitle: Row(
            children: [
              Text(widget.favouriteData.jobs!.compName!,
                  style: Styles.textStyle10(
                    color: AppTheme.neutral7,
                  )),
              Expanded(
                child: Text("• ${widget.favouriteData.jobs!.location!}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle10(
                      color: AppTheme.neutral7,
                    )),
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: () {
              Scaffold.of(context).showBottomSheet<void>(
                (BuildContext context) => SlideTransitionAnimation(
                  duration: const Duration(seconds: 1),
                  begin: const Offset(0, 0.2),
                  end: Offset.zero,
                  child: CustomBottomSheet(
                    items: [
                      BottomSheetItem(
                        'Apply Job',
                        actionIcon: Iconsax.directbox_notif,
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoute.jobDetailsScreen,
                              arguments: widget.favouriteData.jobs);
                        },
                      ),
                      BottomSheetItem(
                        'Share via...',
                        actionIcon: Iconsax.export,
                        onTap: () async {
                          await FavouriteCubit.get(context).shareImageFromApi(
                              imageUrl: widget.favouriteData.image!,
                              text:
                                  widget.favouriteData.jobs!.jobDescription!,
                              subject: widget.favouriteData.jobs!.name!);
                        },
                      ),
                      BottomSheetItem(
                        'Cancel save',
                        actionIcon: Iconsax.archive_minus,
                        onTap: () {
                          cubit.removeFavourite(
                              widget.favouriteData.id.toString());
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(
              Iconsax.more,
              size: 24.0,
            ),
          ),
          contentPadding: EdgeInsets.zero,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Posted 2 days ago',
                style: Styles.textStyle10(
                  color: AppTheme.neutral7,
                )),
            Spacer(),
            Row(
              children: [
                const Icon(
                  Iconsax.clock,
                  size: 12,
                  color: AppTheme.success7,
                ),
                const SizedBox(width: 6.0),
                Text('Be an early applicant',
                    style: Styles.textStyle10(
                      color: AppTheme.neutral7,
                    ))
              ],
            )
          ],
        ),
        SizedBox(height: 1.h),
      ],
    );
  }
}
