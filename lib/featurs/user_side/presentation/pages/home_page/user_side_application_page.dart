import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mw_herafy/theme/color/app_theme.dart';
import '../../../../auth/presentation/pages/register_pages_login_pages/widgets/register_textefilds.dart';

class UserSideApplicationPage extends StatefulWidget {
  const UserSideApplicationPage({super.key});

  @override
  State<UserSideApplicationPage> createState() =>
      _UserSideApplicationPageState();
}

class _UserSideApplicationPageState extends State<UserSideApplicationPage> {
  final locationCtr = TextEditingController();
  final priceCtr = TextEditingController();
  final discriptonCtr = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    locationCtr.dispose();
    priceCtr.dispose();
    discriptonCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColorScheme.onPrimary,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "تقديم طلب لحجز الحرفي",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: lightColorScheme.primary, fontSize: 20.sp),
        ),
        backgroundColor: lightColorScheme.onPrimary,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  RegisterTextefilds(
                    label: "مكان الشغل فين",
                    hint: "مثلا الدقهليه المنصوره شارع الجامعه",
                    controller: locationCtr,
                    valodator: (valu) {
                      if (valu!.isEmpty) {
                        return "عنوان الشغل مطلوب";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  RegisterTextefilds(
                    label: "السعر الي انت حابب تدفعه",
                    hint: "50",
                    controller: priceCtr,
                    valodator: (valu) {
                      if (valu!.isEmpty) {
                        return "السعر مطلوب";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  RegisterTextefilds(
                    label: "تفاصيل الشغل",
                    hint: "حاول ان تكون واضحا ف التفاصيل",
                    controller: discriptonCtr,
                    maxlines: 6,
                    valodator: (valu) {
                      if (valu!.isEmpty) {
                        return "تفاصيل الشغل مطلوبه";
                      }
                      return null;
                    },
                  ),
                  // Add some bottom padding to avoid overlap with buttons
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 150.w,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(width: 2, color: lightColorScheme.primary),
                ),
                child: Center(
                  child: Text(
                    "الغاء",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: lightColorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pop(context);
                }
              },
              child: Container(
                width: 150.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: lightColorScheme.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    "ارسال",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: lightColorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
