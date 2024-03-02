import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/app_widgets/custom_textformfield.dart';
import 'package:jobsque/core/app_widgets/snack_bar.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/profile/presentation/view_models/cubit/profile_cubit.dart';
import 'package:sizer/sizer.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  TextEditingController positionController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController startYearController = TextEditingController();
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
        value: "Full time",
        child: Text('Full time',
            style: Styles.textStyle11.copyWith(
              color: AppTheme.neutral9,
            ))),
    DropdownMenuItem(
        value: "Part time",
        child: Text('Part time',
            style: Styles.textStyle11.copyWith(
              color: AppTheme.neutral9,
            ))),
  ];

  String selectedValue = "Full time";
  final formKey = GlobalKey<FormState>();

  late ProfileCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = ProfileCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Experience", context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                //height: 484,
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 12,
                  right: 12,
                  bottom: 16,
                ),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppTheme.neutral3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Position *',
                          style: Styles.textStyle13.copyWith(
                            color: AppTheme.neutral4,
                          )),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Position must not be empty';
                          } else {
                            return null;
                          }
                        },
                        controller: positionController,
                        hintText: "Position",
                        obscureText: false,
                        type: TextInputType.text,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text('Type of work',
                          style: Styles.textStyle13.copyWith(
                            color: AppTheme.neutral4,
                          )),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      DropdownButtonFormField(
                          icon: const Icon(
                            Iconsax.arrow_down_14,
                            color: AppTheme.neutral9,
                          ),
                          decoration: InputDecoration(
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
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            selectedValue = newValue!;
                          },
                          items: menuItems),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text('Company name *',
                          style: Styles.textStyle13.copyWith(
                            color: AppTheme.neutral4,
                          )),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Company must not be empty';
                          } else {
                            return null;
                          }
                        },
                        controller: companyNameController,
                        hintText: "Company Name",
                        obscureText: false,
                        type: TextInputType.name,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text('Location',
                          style: Styles.textStyle13.copyWith(
                            color: AppTheme.neutral4,
                          )),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Location must not be empty';
                          } else {
                            return null;
                          }
                        },
                        controller: locationController,
                        hintText: "Location",
                        obscureText: false,
                        prifix: const Icon(Iconsax.location),
                        prefixIconColor: AppTheme.neutral9,
                        type: TextInputType.streetAddress,
                      ),
                      Row(
                        children: [
                          BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, state) {
                              return Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: cubit.isChecked,
                                  activeColor: AppTheme.primary5,
                                  checkColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  side: const BorderSide(
                                    color: AppTheme.neutral4,
                                  ),
                                  onChanged: (newValue) {
                                    cubit.changeCheck(newValue);
                                  });
                            },
                          ),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text('I am currently working in this role',
                                style: Styles.textStyle11.copyWith(
                                  color: AppTheme.neutral9,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text('Start Year *',
                          style: Styles.textStyle13.copyWith(
                            color: AppTheme.neutral4,
                          )),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Start Year must not be empty';
                          } else {
                            return null;
                          }
                        },
                        controller: startYearController,
                        hintText: "Start Year",
                        obscureText: false,
                        suffixIcon: const Icon(Iconsax.calendar_1),
                        suffixIconColor: AppTheme.neutral9,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1970),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          //print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat.yMMMd().format(pickedDate!);
                          startYearController.text =
                              formattedDate; //set output date to TextField value.
                        },
                        type: TextInputType.text,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      BlocConsumer<ProfileCubit, ProfileState>(
                        listener: (context, state) {
                          if (state is AddExperienceSuccessState) {
                            showSuccessSnackBar(
                                context: context,
                                message: 'Experience Updated Successfully');
                            Navigator.pop(context);
                          } else if (state is AddExperienceErrorState) {
                            showErrorSnackBar(
                                context: context,
                                message: 'There something wrong, Try Again');
                          }
                        },
                        builder: (context, state) {
                          return CustomMainButton(
                              isLoading: state is AddExperienceLoadingState,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.addExperience(
                                      position: positionController.text,
                                      typeWork: selectedValue,
                                      companyName: companyNameController.text,
                                      location: locationController.text,
                                      startDate: startYearController.text);
                                }
                              },
                              text: "Save");
                        },
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),

              // experience Tile

              // Column(
              //   children: [
              //     Container(
              //       width: MediaQuery.of(context).size.width,
              //
              //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              //       decoration: ShapeDecoration(
              //         shape: RoundedRectangleBorder(
              //           side: const BorderSide( color: AppTheme.neutral3),
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //       ),
              //       child: const EducationListTile(image:"https://cdn-icons-png.flaticon.com/128/3536/3536424.png", title: 'The University of Arizona', bachelor: 'Remote • GrowUp Studio', date: '2015-2018',),
              //     ),
              //     SizedBox(height: 3.h,)
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
