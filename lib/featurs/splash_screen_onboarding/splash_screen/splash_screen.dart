import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/color/app_theme.dart';
import '../onboarding_screens/onboarding_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const OnboardingScreen()), // You'll need to create this screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColorScheme.onPrimary,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/splashback.png"),
                fit: BoxFit.fill)),
        child: Center(
          child: Container(
            width: 370.w,
            height: 370.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"))),
          ),
        ),
      ),
    );
  }
}
