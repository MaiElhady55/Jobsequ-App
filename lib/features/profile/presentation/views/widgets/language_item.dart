import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/profile/data/models/languageModel.dart';
import 'package:jobsque/features/profile/presentation/view_models/cubit/profile_cubit.dart';
import 'package:sizer/sizer.dart';


class CustomLanguageItem extends StatefulWidget {
  final int value;
  final LanguageModel languageModel;

  const CustomLanguageItem(this.value, this.languageModel, {super.key});

  @override
  State<CustomLanguageItem> createState() => _CustomLanguageItemState();
}

class _CustomLanguageItemState extends State<CustomLanguageItem> {
  late ProfileCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return ListTile(
          onTap: () {
            cubit.selectChoice(widget.value);
          },
          leading: SizedBox(
            width: 8.5.w,
            height: 2.5.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(
                widget.languageModel.flag,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            widget.languageModel.lang,
            style: Styles.textStyle13.copyWith(color: AppTheme.neutral9,)
          ),
          trailing: Radio(
            value: widget.value,
            groupValue: cubit.selectedChoice,
            activeColor: AppTheme.primary5,
            splashRadius: 25,
            onChanged: (value) {},
          ),
          contentPadding: EdgeInsets.zero,
        );
      },
    );
  }
}