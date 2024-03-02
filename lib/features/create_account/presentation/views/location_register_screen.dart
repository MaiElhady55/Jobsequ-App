import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/app_widgets/snack_bar.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/size_config.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/create_account/data/models/country_model/country_model.dart';
import 'package:jobsque/features/create_account/presentation/view_models/cubit/register_cubit.dart';
import 'package:jobsque/features/create_account/presentation/views/widgets/custom_country_item.dart';
import 'package:jobsque/features/create_account/presentation/views/widgets/custom_tabBar.dart';
import 'package:sizer/sizer.dart';

class LocationRegisterScreen extends StatefulWidget {
  const LocationRegisterScreen({super.key});

  @override
  State<LocationRegisterScreen> createState() => _LocationRegisterScreenState();
}

class _LocationRegisterScreenState extends State<LocationRegisterScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late RegisterCubit cubit;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    cubit = RegisterCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Where are you preferred Location?',
                        maxLines: 2, style: Styles.textStyle20),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                        'Let us know, where is the work location you want at this time, so we can adjust it.',
                        style: Styles.textStyle13),
                    SizedBox(
                      height: 3.6.h,
                    ),
                    CustomTabBar(tabController: tabController),
                    SizedBox(
                      height: 2.4.h,
                    ),
                    const Text(
                      'Select the country you want for your job',
                      style: TextStyle(
                        color: Color(0xFF737379),
                        fontSize: 16,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: SizeConfig.height(context) * 0.50,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          BlocBuilder<RegisterCubit, RegisterState>(
                            builder: (context, state) {
                              return Wrap(
                                  children: countries
                                      .map((e) => CustomCountryItem(
                                            countryName: e.name,
                                            countryImage: e.image,
                                          ))
                                      .toList());
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is DataSuccessfullyState) {
                        showSuccessSnackBar(
                            context: context,
                            message: 'User Data setup Successfully');
                        //hint: cache data registered to true
                        Navigator.pushNamedAndRemoveUntil(context,
                            AppRoute.successRegisterScreen, (route) => false);
                      } else if (state is DataErrorState) {
                        showErrorSnackBar(
                            context: context,
                            message: 'There is something went wrong.Try Again');
                      }
                    },
                    builder: (context, state) {
                      return CustomMainButton(
                          isLoading: state is DataLoadingState,
                          onPressed: () {
                            cubit.userDataSetup();
                          },
                          text: "Next");
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
