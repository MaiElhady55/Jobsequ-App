import 'package:flutter/material.dart';
import 'package:jobsque/core/app_widgets/custom_main_button.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/create_account/presentation/views/widgets/interest_gride_view.dart';
import 'package:sizer/sizer.dart';

class RegisterWorkScreen extends StatefulWidget {
  const RegisterWorkScreen({super.key});

  @override
  State<RegisterWorkScreen> createState() => _RegisterWorkScreenState();
}

class _RegisterWorkScreenState extends State<RegisterWorkScreen> {
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
                    Text('What type of work are you interested in?',
                        maxLines: 2, style: Styles.textStyle20),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                        'Tell us what you’re interested in so we can customise the app for your needs.',
                        style: Styles.textStyle13),
                    SizedBox(
                      height: 3.6.h,
                    ),
                    // BlocBuilder<RegisterCubit,RegisterState>(
                    // builder: (context,state){
                    //return
                    IntresetGrideView(),
                    //}

                    // ),

                    SizedBox(
                      height: 10.h,
                    ),

                    //  const Spacer(),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomMainButton(
                      onPressed: () {
                        //cubit.userInterestedWork();
                        Navigator.pushNamedAndRemoveUntil(context,
                            AppRoute.locationRegisterScreen, (route) => false);
                      },
                      text: "Next"))
            ],
          ),
        ),
      ),
    );
  }
}
