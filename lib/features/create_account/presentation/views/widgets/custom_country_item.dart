import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/create_account/presentation/view_models/cubit/register_cubit.dart';
import 'package:sizer/sizer.dart';

class CustomCountryItem extends StatefulWidget {
  final String countryName;
  final String countryImage;

  const CustomCountryItem({
    super.key,
    required this.countryName,
    required this.countryImage,
  });

  @override
  State<CustomCountryItem> createState() => _CustomCountryItemState();
}

class _CustomCountryItemState extends State<CustomCountryItem> {
  late RegisterCubit cubit;
  @override
  void initState() {
    cubit = RegisterCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (cubit.selectedCountries.contains(widget.countryName)) {
          cubit.deleteItemCountry(widget.countryName);
        } else {
          cubit.addItemCountry(widget.countryName);
        }
        print(cubit.selectedCountries);
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 42,
          padding:
              const EdgeInsets.only(top: 8, left: 10, right: 14, bottom: 8),
          decoration: ShapeDecoration(
            color: cubit.selectedCountries.contains(widget.countryName)
                ? AppTheme.primary1
                : const Color(0xFFFAFAFA),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: cubit.selectedCountries.contains(widget.countryName)
                      ? AppTheme.primary5
                      : AppTheme.neutral2),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.countryImage),
                    fit: BoxFit.fill,
                  ),
                  shape: const OvalBorder(),
                ),
              ),
              SizedBox(width: 1.5.w),
              Flexible(
                child: Text(widget.countryName, style: Styles.textStyle16W400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
