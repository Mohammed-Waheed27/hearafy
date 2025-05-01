import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../theme/color/app_theme.dart';
import '../chat_page/chat_page.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for demonstration
    final List<Map<String, dynamic>> workers = [
      {
        'name': 'أحمد محمود',
        'profession': 'سباك',
        'lastMessage': 'سأكون متاح غداً لإصلاح الصنبور',
        'time': '10:30',
        'hasUnread': true,
      },
      {
        'name': 'محمد علي',
        'profession': 'كهربائي',
        'lastMessage': 'شكراً لتواصلك معي',
        'time': 'أمس',
        'hasUnread': false,
      },
      {
        'name': 'خالد أحمد',
        'profession': 'نجار',
        'lastMessage': 'تم الانتهاء من العمل',
        'time': 'الأحد',
        'hasUnread': false,
      },
    ];

    return Scaffold(
      backgroundColor: lightColorScheme.onPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        backgroundColor: lightColorScheme.onPrimary,
        elevation: 0,
        title: Text(
          'المحادثات',
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: lightColorScheme.scrim,
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Text(
                "الرسائل",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: lightColorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
              ),
            ),
            // Search bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'بحث...',
                  hintTextDirection: TextDirection.rtl,
                  prefixIcon: Icon(
                    Icons.search,
                    color: lightColorScheme.surface,
                  ),
                  filled: true,
                  fillColor: lightColorScheme.onSurface,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: ListView.builder(
                itemCount: workers.length,
                itemBuilder: (context, index) {
                  final worker = workers[index];
                  return _buildChatListItem(context, worker);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatListItem(BuildContext context, Map<String, dynamic> worker) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              workerName: worker['name'],
              profession: worker['profession'],
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: lightColorScheme.outline,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: [
            // Profile picture
            CircleAvatar(
              radius: 24.r,
              backgroundColor: lightColorScheme.primaryContainer,
              child: Text(
                worker['name'][0],
                style: TextStyle(
                  color: lightColorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            // Chat details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        worker['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: lightColorScheme.scrim,
                        ),
                      ),
                      Text(
                        worker['time'],
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: lightColorScheme.surface,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        worker['profession'],
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: lightColorScheme.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (worker['hasUnread'])
                        Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                            color: lightColorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: lightColorScheme.onPrimary,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    worker['lastMessage'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: worker['hasUnread']
                          ? lightColorScheme.scrim
                          : lightColorScheme.surface,
                      fontWeight: worker['hasUnread']
                          ? FontWeight.w500
                          : FontWeight.normal,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
