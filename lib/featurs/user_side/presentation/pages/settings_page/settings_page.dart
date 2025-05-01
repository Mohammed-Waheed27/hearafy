import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../theme/color/app_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColorScheme.onPrimary,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        backgroundColor: lightColorScheme.onPrimary,
        elevation: 0,
        title: Text(
          'الإعدادات',
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: lightColorScheme.scrim,
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                // Profile section
                _buildProfileSection(context),
                SizedBox(height: 24.h),

                // Account settings
                _buildSectionTitle(context, 'إعدادات الحساب'),
                _buildSettingItem(
                  context,
                  icon: Icons.person,
                  title: 'المعلومات الشخصية',
                  subtitle: 'تعديل معلوماتك الشخصية',
                  iconColor: lightColorScheme.primary,
                ),
                _buildSettingItem(
                  context,
                  icon: Icons.lock,
                  title: 'الأمان والخصوصية',
                  subtitle: 'كلمة المرور وتأمين الحساب',
                  iconColor: lightColorScheme.secondary,
                ),
                // _buildSettingItem(
                //   context,
                //   icon: Icons.notifications,
                //   title: 'الإشعارات',
                //   subtitle: 'تفضيلات الإشعارات والتنبيهات',
                //   iconColor: Colors.amber,
                // ),

                // SizedBox(height: 16.h),
                // // Application settings
                // _buildSectionTitle(context, 'إعدادات التطبيق'),
                // _buildSettingItem(
                //   context,
                //   icon: Icons.language,
                //   title: 'اللغة',
                //   subtitle: 'العربية',
                //   hasSwitch: false,
                //   iconColor: Colors.green,
                // ),
                // _buildSettingItem(
                //   context,
                //   icon: Icons.dark_mode,
                //   title: 'الوضع الداكن',
                //   subtitle: 'تغيير مظهر التطبيق',
                //   hasSwitch: true,
                //   iconColor: Colors.indigo,
                // ),

                // SizedBox(height: 16.h),
                // // Support section
                // _buildSectionTitle(context, 'الدعم'),
                // _buildSettingItem(
                //   context,
                //   icon: Icons.help,
                //   title: 'مركز المساعدة',
                //   subtitle: 'أسئلة شائعة ودعم',
                //   iconColor: Colors.teal,
                // ),
                // _buildSettingItem(
                //   context,
                //   icon: Icons.info,
                //   title: 'عن التطبيق',
                //   subtitle: 'الإصدار 1.0.0',
                //   iconColor: Colors.blue,
                // ),

                SizedBox(height: 24.h),
                // Logout button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Logout functionality
                    },
                    icon: Icon(
                      Icons.logout,
                      color: lightColorScheme.onPrimary,
                    ),
                    label: Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                        color: lightColorScheme.onPrimary,
                        fontSize: 16.sp,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightColorScheme.error,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: lightColorScheme.onSecondary,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32.r,
            backgroundColor: lightColorScheme.primary,
            child: Text(
              'م',
              style: TextStyle(
                color: lightColorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'محمد أحمد',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: lightColorScheme.scrim,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'mohamed@example.com',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: lightColorScheme.surface,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              color: lightColorScheme.primary,
            ),
            onPressed: () {
              // Edit profile functionality
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: lightColorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconColor,
    bool hasSwitch = false,
  }) {
    return InkWell(
      onTap: () {
        // Navigate to setting detail
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 24.r,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: lightColorScheme.scrim,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: lightColorScheme.surface,
                    ),
                  ),
                ],
              ),
            ),
            hasSwitch
                ? Switch(
                    value: false, // Default value
                    onChanged: (value) {
                      // Toggle setting
                    },
                    activeColor: lightColorScheme.primary,
                  )
                : Icon(
                    Icons.arrow_forward_ios,
                    size: 16.r,
                    color: lightColorScheme.surface,
                  ),
          ],
        ),
      ),
    );
  }
}
