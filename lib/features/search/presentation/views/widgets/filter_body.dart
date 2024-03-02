import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/app_widgets/custom_textformfield.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/search/presentation/view_models/cubit/search_cubit.dart';
import 'package:jobsque/features/search/presentation/views/widgets/job_feature_filter.dart';
import 'package:sizer/sizer.dart';

class FilterBody extends StatefulWidget {
  const FilterBody({Key? key}) : super(key: key);

  @override
  State<FilterBody> createState() => _FilterBodyState();
}

class _FilterBodyState extends State<FilterBody> {
  TextEditingController locationController = TextEditingController();

  late SearchCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = SearchCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.70,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 40,
      ),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Iconsax.arrow_left),
                    ),
                    Text('Set Filter',
                        style: Styles.textStyle16.copyWith(
                            color: AppTheme.neutral9, fontSize: 16.5)),
                    BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        return TextButton(
                            onPressed: () {
                              locationController.text = '';
                              cubit.changeSelectedSalary('');
                              cubit.jobTypeFilter.clear();
                            },
                            child: Text('Reset',
                                style: Styles.textStyle13.copyWith(
                                  color: AppTheme.primary5,
                                )));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text('Location',
                    style: Styles.textStyle13.copyWith(
                      color: AppTheme.neutral9,
                    )),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextFormField(
                  prifix: const Icon(Iconsax.location),
                  prefixIconColor: MaterialStateColor.resolveWith((states) =>
                      states.contains(MaterialState.focused)
                          ? AppTheme.neutral9
                          : AppTheme.neutral3),
                  controller: locationController,
                  hintText: "Location",
                  obscureText: false,
                  type: TextInputType.streetAddress,
                  validator: (String) {return null;},
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text('Salary',
                    style: Styles.textStyle13.copyWith(
                      color: AppTheme.neutral9,
                    )),
                SizedBox(
                  height: 1.h,
                ),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    return DropdownButtonFormField(
                        hint: const Text('Select Salary'),
                        icon: const Icon(
                          Iconsax.arrow_down_14,
                          color: AppTheme.neutral9,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.dollar_circle),
                          prefixIconColor: AppTheme.neutral9,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppTheme.neutral3,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.primary5),
                          ),
                        ),
                        value: cubit.selectedValue,
                        onChanged: (String? newValue) {
                          cubit.changeSelectedSalary(newValue);
                        },
                        items: cubit.menuItems);
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text('Job Type',
                    style: Styles.textStyle13.copyWith(
                      color: AppTheme.neutral9,
                    )),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    const JobFeatureFilter(
                      text: "FullTime",
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    const JobFeatureFilter(text: "Remote"),
                    SizedBox(
                      width: 2.w,
                    ),
                    const JobFeatureFilter(text: "Contract")
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    const JobFeatureFilter(text: "Part Time"),
                    SizedBox(
                      width: 2.w,
                    ),
                    const JobFeatureFilter(text: "Onsite"),
                    SizedBox(
                      width: 2.w,
                    ),
                    const JobFeatureFilter(text: "Internship")
                  ],
                ),
                SizedBox(
                  height: 10.h,
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: BlocConsumer<SearchCubit, SearchState>(
                listener: (context, state) {
                  if (state is SearchLoaded || state is SearchEmpty) {
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return BuildCondition(
                    condition: state is! SearchLoading,
                    builder: (context) => CustomMainButton(
                        onPressed: () {
                          cubit.fetchDataWithFilters(
                              location: locationController.text);
                        },
                        text: "Show Result"),
                    fallback: (context) => const CircularProgressIndicator(),
                  );
                },
              ))
        ],
      ),
    );
  }
}
