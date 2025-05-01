import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mw_herafy/featurs/auth/presentation/pages/register_pages_login_pages/sections/header.dart';
import 'package:mw_herafy/featurs/auth/presentation/pages/register_pages_login_pages/sections/logo_register_section.dart';
import 'package:mw_herafy/featurs/auth/presentation/pages/register_pages_login_pages/widgets/auth_primary_button.dart';
import 'package:mw_herafy/theme/color/app_theme.dart';

import '../../../../user_side/wrapper/NavigationWrapper.dart';

class FinalRegistrationPage extends StatelessWidget {
  const FinalRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColorScheme.onPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Spacer(),
                HeaderText(
                  Title: "تهانيا تم انشاء حسابك بنجاح",
                ),
                SizedBox(
                  height: 50.h,
                ),
                StylizedTitle(),
                Spacer(),
                AuthPrimaryButton(
                  button_label: "تسجيل الدخول",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NavigationWrapper()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
