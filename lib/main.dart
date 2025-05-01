import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'featurs/auth/presentation/pages/register_pages_login_pages/final_registration_page.dart';
import 'featurs/auth/presentation/pages/register_pages_login_pages/register_page_1.dart';
import 'featurs/splash_screen_onboarding/splash_screen/splash_screen.dart';
import 'theme/color/app_theme.dart';
import 'theme/font/fontthem.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    // this is where i put my shit

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'حرفي',
          theme: ThemeData(
            colorScheme: lightColorScheme,
            textTheme: FontTheme.textTheme,
            useMaterial3: true,
          ),
          home: const FinalRegistrationPage(),
        );
      },
    );
  }
}
