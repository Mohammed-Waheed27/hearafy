import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mw_herafy/theme/color/app_theme.dart';
import 'sections/latest_reservations_section.dart';
import 'sections/worker_welcome_section.dart';
import 'widgets/drawer_widget.dart';

class WorkerHomePage extends StatelessWidget {
  const WorkerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: lightColorScheme.primary,
        title: Text(
          "الصفحة الرئيسية",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: lightColorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: lightColorScheme.onPrimary),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      drawer: const WorkerDrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WorkerWelcomeSection(),
                SizedBox(height: 20.h),
                const LatestReservationsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
