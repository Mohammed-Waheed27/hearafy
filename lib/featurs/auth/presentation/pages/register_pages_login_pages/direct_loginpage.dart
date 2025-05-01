import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mw_herafy/featurs/auth/presentation/pages/register_pages_login_pages/sections/header.dart';
import 'package:mw_herafy/featurs/auth/presentation/pages/register_pages_login_pages/sections/logo_register_section.dart';
import 'package:mw_herafy/featurs/auth/presentation/pages/register_pages_login_pages/widgets/auth_primary_button.dart';
import 'package:mw_herafy/featurs/auth/presentation/pages/register_pages_login_pages/widgets/register_textefilds.dart';
import 'package:mw_herafy/theme/color/app_theme.dart';

import '../../../../user_side/presentation/pages/home_page/user_home_page.dart';
import 'register_page_1.dart';

class DirectLoginpage extends StatefulWidget {
  const DirectLoginpage({super.key});

  @override
  State<DirectLoginpage> createState() => _DirectLoginpageState();
}

class _DirectLoginpageState extends State<DirectLoginpage> {
  final email_ctrl = TextEditingController();
  final password_ctrl = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    email_ctrl.dispose();
    password_ctrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColorScheme.onPrimary,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: Center(
          child: Column(
            children: [
              StylizedTitle(),
              HeaderText(Title: "تسجيل الدخول"),
              Container(
                height: 500,
                child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RegisterTextefilds(
                          label: "البريد الالكتروني",
                          hint: "gmail",
                          controller: email_ctrl,
                          valodator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'البريد الالكتروني مطلوب';
                            } else if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'الإيميل مش صحيح';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        RegisterTextefilds(
                            label: "كلمة المرور",
                            hint: "password ",
                            controller: password_ctrl,
                            valodator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'كلمة المرور مطلوبة';
                              } else if (value == "lol") {
                                return null;
                              } else
                                return 'كلمة المرور مش صحيحة';
                            }),
                      ],
                    )),
              ),
              AuthPrimaryButton(
                button_label: "تسجيل الدخول",
                onTap: () {
                  FocusScope.of(context).unfocus();
                  if (formkey.currentState!.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UserHomePage()));
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterPage1()));
                    },
                    child: Text(
                      "انشاء حساب جديد",
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: lightColorScheme.primary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    "ليس لديك حساب ؟",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: lightColorScheme.surface,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
