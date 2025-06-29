import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mw_herafy/theme/color/app_theme.dart';

class WorkerDrawerWidget extends StatelessWidget {
  const WorkerDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock worker data
    final String workerName = "محمد";
    final String serviceName = "سباك";
    final String workerImage =
        "assets/images/placeholder.png"; // Default placeholder

    return Drawer(
      backgroundColor: lightColorScheme.onPrimary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(context, workerName, serviceName, workerImage),
          _buildDrawerItem(
            context: context,
            icon: Icons.home,
            title: "الصفحة الرئيسية",
            onTap: () {
              Navigator.pop(context);
              // Already on home page, no navigation needed
            },
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.calendar_today,
            title: "الحجوزات",
            onTap: () {
              Navigator.pop(context);
              // Navigate to reservations page
            },
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.chat,
            title: "المحادثات",
            onTap: () {
              Navigator.pop(context);
              // Navigate to chats page
            },
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.history,
            title: "سجل الحجوزات",
            onTap: () {
              Navigator.pop(context);
              // Navigate to history page
            },
          ),
          Divider(color: lightColorScheme.outline),
          _buildDrawerItem(
            context: context,
            icon: Icons.person,
            title: "الملف الشخصي",
            onTap: () {
              Navigator.pop(context);
              // Navigate to profile page
            },
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.settings,
            title: "الإعدادات",
            onTap: () {
              Navigator.pop(context);
              // Navigate to settings page
            },
          ),
          Divider(color: lightColorScheme.outline),
          _buildDrawerItem(
            context: context,
            icon: Icons.logout,
            title: "تسجيل الخروج",
            onTap: () {
              Navigator.pop(context);
              // Handle logout
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(
    BuildContext context,
    String name,
    String service,
    String imageUrl,
  ) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: lightColorScheme.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundColor: lightColorScheme.onPrimary,
            backgroundImage: AssetImage(imageUrl),
            onBackgroundImageError: (_, __) {
              // Handle error loading image
            },
          ),
          SizedBox(height: 10.h),
          Text(
            name,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: lightColorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 4.h),
          Text(
            service,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: lightColorScheme.onPrimary.withOpacity(0.8),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: lightColorScheme.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: lightColorScheme.scrim,
            ),
      ),
      onTap: onTap,
    );
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: lightColorScheme.onPrimary,
          title: Text(
            'تسجيل الخروج',
            style: TextStyle(color: lightColorScheme.scrim),
          ),
          content: Text(
            'هل أنت متأكد من رغبتك في تسجيل الخروج؟',
            style: TextStyle(color: lightColorScheme.scrim),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'إلغاء',
                style: TextStyle(color: lightColorScheme.primary),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'تسجيل الخروج',
                style: TextStyle(color: lightColorScheme.error),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                // Implement actual logout functionality
              },
            ),
          ],
        );
      },
    );
  }
}
