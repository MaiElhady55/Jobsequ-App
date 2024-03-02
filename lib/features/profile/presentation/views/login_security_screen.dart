import 'package:flutter/material.dart';
import 'package:jobsque/core/app_widgets/custom_appbar.dart';
import 'package:jobsque/core/constance/enums.dart';
import 'package:jobsque/core/network/local/cache_helper.dart';
import 'package:jobsque/core/route/app_route.dart';
import 'package:jobsque/features/notification/presentation/views/widgets/custom_header.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/account_access_tile.dart';

class LoginAndSecurityScreen extends StatelessWidget {
  const LoginAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Login and security', context),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const CustomHeader('Account access'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                CustomAccountAccessTile(
                  title: "Email address",
                  trailingTitle:
                      CachHelper.getData(key: MySharedKeys.email.toString()),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.emailAddressScreen);
                  },
                ),
                CustomAccountAccessTile(
                  title: "Phone number",
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.phoneNumberScreen);
                  },
                ),
                CustomAccountAccessTile(
                  title: "Change Password",
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.changePasswordScreen);
                  },
                ),
                CustomAccountAccessTile(
                  title: 'Two-step verification',
                  trailingTitle: 'Non active',
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.twoStepVerification1);
                  },
                ),
                const CustomAccountAccessTile(title: 'Face ID'),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
