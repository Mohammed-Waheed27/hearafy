import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mw_herafy/theme/color/app_theme.dart';
import 'sections/profile_header_section.dart';
import 'sections/profile_info_section.dart';
import 'sections/worker_portfolio_section.dart';

class WorkerProfilePage extends StatelessWidget {
  const WorkerProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: lightColorScheme.primary,
        title: Text(
          "الملف الشخصي",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: lightColorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // Navigate to edit profile page
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                const ProfileHeaderSection(),
                SizedBox(height: 24.h),
                const ProfileInfoSection(),
                SizedBox(height: 24.h),
                const WorkerPortfolioSection(),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
