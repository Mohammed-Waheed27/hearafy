import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mw_herafy/featurs/user_side/presentation/pages/chats_page/chats_page.dart';
import 'package:mw_herafy/featurs/user_side/presentation/pages/home_page/user_home_page.dart';
import 'package:mw_herafy/featurs/user_side/presentation/pages/reservations_page/reservations_page.dart';
import 'package:mw_herafy/featurs/user_side/presentation/pages/settings_page/settings_page.dart';
import 'package:mw_herafy/theme/color/app_theme.dart';

class NavigationWrapper extends StatefulWidget {
  const NavigationWrapper({Key? key, this.initialIndex = 2}) : super(key: key);
  final int initialIndex; // الصفحة الافتراضية عند الفتح

  @override
  NavigationWrapperState createState() => NavigationWrapperState();
}

class NavigationWrapperState extends State<NavigationWrapper> {
  late int _selectedIndex;
  final List<Widget> _pages = const [
    SettingsPage(),
    ChatsPage(),
    UserHomePage(),
    ReservationsPage(),
    SettingsPage() // More options page
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget
        .initialIndex; // يضبط الفهرس الابتدائي :contentReference[oaicite:4]{index=4}
  }

  /// استدعاء برمجي للتنقل لصفحة معينة
  void navigateTo(int index) {
    if (index >= 0 && index < _pages.length) {
      setState(() => _selectedIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[
          _selectedIndex], // يعرض الصفحة المختارة :contentReference[oaicite:5]{index=5}
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: lightColorScheme.onSecondary,
        child: GNav(
          activeColor: lightColorScheme.primary,
          gap: 8
              .w, // المسافة بين الأيقونة والنص :contentReference[oaicite:6]{index=6}
          iconSize: 24.sp, // حجم الأيقونات
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          tabActiveBorder:
              Border.all(color: lightColorScheme.secondaryContainer, width: 1),
          tabBorderRadius: 16,
          selectedIndex:
              _selectedIndex, // يحدد التاب النشط :contentReference[oaicite:7]{index=7}
          onTabChange: (index) => setState(() => _selectedIndex = index),
          tabs: const [
            GButton(icon: Icons.person, text: 'الملف'),
            GButton(icon: Icons.chat_bubble, text: 'الدردشات'),
            GButton(icon: Icons.home, text: 'الرئيسية'),
            GButton(icon: Icons.bookmark, text: 'الحجوزات'),
            GButton(icon: Icons.settings, text: 'الإعدادات'),
          ],
        ),
      ),
    );
  }
}
