import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/search/presentation/view_models/cubit/search_cubit.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.hintText,
    this.onTap,
    this.keyboardType,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late SearchCubit cubit;
  @override
  void initState() {
    cubit=SearchCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextFormField(
        onTap: widget.onTap,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        onChanged: (value) {
          cubit.searchJob(name: value);
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Iconsax.search_normal),
          prefixIconColor: const Color(0xFF292D32),
          hintText: widget.hintText,
          hintStyle: Styles.textStyle14,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: AppTheme.neutral3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: AppTheme.primary5),
          ),
        ),
      ),
    );
  }
}
