import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/app_widgets/custom_phone_textformfield.dart';
import 'package:jobsque/core/app_widgets/custom_textformfield.dart';
import 'package:jobsque/core/app_widgets/snack_bar.dart';
import 'package:jobsque/core/constance/enums.dart';
import 'package:jobsque/core/network/local/cache_helper.dart';
import 'package:jobsque/core/shimmer/shimmer_circle_avatar_effect.dart';
import 'package:jobsque/core/utils/app_colors.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/profile/presentation/view_models/cubit/profile_cubit.dart';
import 'package:sizer/sizer.dart';

class EditDetalisScreen extends StatefulWidget {
  EditDetalisScreen({Key? key}) : super(key: key);

  @override
  State<EditDetalisScreen> createState() => _EditDetalisScreenState();
}

class _EditDetalisScreenState extends State<EditDetalisScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController bioController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController workController = TextEditingController();
  late ProfileCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = ProfileCubit.get(context);
    cubit.getProfileNameAndEmail();
    cubit.getProfileDetailsAndPortfolios();
    nameController.text = CachHelper.getData(key: MySharedKeys.name.toString());
     //bioController.text = cubit.profileDetails[0].bio ?? '';
    // addressController.text = cubit.profileDetails[0].address ?? '';
    // phoneController.text = cubit.profileDetails[0].mobile ?? '';
    // workController.text = cubit.profileDetails[0].interestedWork ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Edit Details", context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            BlocConsumer<ProfileCubit, ProfileState>(
                              listener: (context, state) {
                                if (state is PickImageSuccess) {
                                  showSuccessSnackBar(
                                      context: context,
                                      message:
                                          'Profile Image Updated Successfully');
                                } else if (state is PickImageError) {
                                  if (state is PickImageSuccess) {
                                    showErrorSnackBar(
                                        context: context,
                                        message:
                                            'There is something went wrong. Try Again');
                                  }
                                }
                              },
                              builder: (context, state) {
                                if (state is PickImageLoading) {
                                  return ShimmerCircleAvatarEffect(
                                    radius: 44,
                                  );
                                } else {
                                  return InkWell(
                                    borderRadius: BorderRadius.circular(100),
                                    onTap: () {
                                      cubit.pickAndSaveProfileImage();
                                    },
                                    child: Container(
                                      width: 24.5.w,
                                      height: 11.5.h,
                                      decoration: ShapeDecoration(
                                        image: cubit.savedImage != null
                                            ? DecorationImage(
                                                image: FileImage(
                                                    cubit.savedImage!),
                                                fit: BoxFit.fill,
                                              )
                                            : const DecorationImage(
                                                image: NetworkImage(
                                                    "https://www.pngall.com/wp-content/uploads/5/Profile-PNG-Free-Download.png"),
                                                fit: BoxFit.cover,
                                              ),
                                        shape: const OvalBorder(
                                          side: BorderSide(
                                              width: 2, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            Positioned(
                              bottom: 4,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                child: const Icon(
                                  Iconsax.camera,
                                  size: 18,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text('Change  Photo',
                            style: Styles.textStyle13.copyWith(
                              color: AppTheme.primary5,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text('Name',
                      style: Styles.textStyle13.copyWith(
                        color: AppTheme.neutral4,
                      )),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return CustomTextFormField(
                        controller: nameController,
                        hintText: 'Name',
                        obscureText: false,
                        type: TextInputType.name,
                      );
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text('Interested Work',
                      style: Styles.textStyle13.copyWith(
                        color: AppTheme.neutral4,
                      )),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  CustomTextFormField(
                      controller: workController,
                      hintText: 'work',
                      type: TextInputType.text,
                      obscureText: false),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text('Bio',
                      style: Styles.textStyle13.copyWith(
                        color: AppTheme.neutral4,
                      )),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  CustomTextFormField(
                      controller: bioController,
                      hintText: 'Bio',
                      type: TextInputType.text,
                      obscureText: false),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text('Address',
                      style: Styles.textStyle13.copyWith(
                        color: AppTheme.neutral4,
                      )),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  CustomTextFormField(
                      controller: addressController,
                      hintText: 'Address',
                      type: TextInputType.streetAddress,
                      obscureText: false),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text('No.Handphone',
                      style: Styles.textStyle13.copyWith(
                        color: AppTheme.neutral4,
                      )),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  CustomPhoneTextFormField(controller: phoneController),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if (state is UpdateProfileSuccessfully) {
                      showSuccessSnackBar(
                          context: context,
                          message: 'Profile Updated Successfully');

                      Navigator.pop(context);
                    } else if (state is UpdateProfileError) {
                      showErrorSnackBar(
                          context: context,
                          message: 'There is something went Wrong. Try Again');
                    }
                  },
                  builder: (context, state) {
                    return CustomMainButton(
                        isLoading: state is UpdateProfileLoading,
                        onPressed: () {
                          print('MMMMMMM${CachHelper.getData(
                                  key: MySharedKeys.completeProfile
                                      .toString())}');
                          if (CachHelper.getData(
                                  key: MySharedKeys.completeProfile
                                      .toString()) ==
                              null) {
                            cubit.addItem('Personal Details');
                            cubit.updateProfileNameAndPassword(
                                name: nameController.text,
                                password: CachHelper.getData(
                                    key: MySharedKeys.password.toString()));
                            cubit.updateUserData(
                                interestedWork: workController.text,
                                mobile: phoneController.text,
                                address: addressController.text,
                                bio: bioController.text);
                          } else {
                            cubit.updateProfileNameAndPassword(
                                name: nameController.text,
                                password: CachHelper.getData(
                                    key: MySharedKeys.password.toString()));
                            cubit.updateUserData(
                                interestedWork: workController.text,
                                mobile: phoneController.text,
                                address: addressController.text,
                                bio: bioController.text);
                          }
                        },
                        text: "Save");
                  },
                )),
          ],
        ),
      ),
    );
  }
}
