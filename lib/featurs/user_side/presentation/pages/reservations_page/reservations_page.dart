import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../theme/color/app_theme.dart';
import '../chat_page/chat_page.dart';

class ReservationsPage extends StatelessWidget {
  const ReservationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for demonstration
    final List<Map<String, dynamic>> reservations = [
      {
        'workerName': 'أحمد محمود',
        'profession': 'سباك',
        'status': 'accepted',
        'date': '15 يوليو 2023',
      },
      {
        'workerName': 'محمد علي',
        'profession': 'كهربائي',
        'status': 'pending',
        'date': '20 يوليو 2023',
      },
      {
        'workerName': 'خالد أحمد',
        'profession': 'نجار',
        'status': 'rejected',
        'date': '10 يوليو 2023',
      },
    ];

    return Scaffold(
      backgroundColor: lightColorScheme.onPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [],
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        backgroundColor: lightColorScheme.onPrimary,
        elevation: 0,
        title: Text(
          'الحجوزات',
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: lightColorScheme.scrim,
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                "حجوزاتك",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: lightColorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView.builder(
                  itemCount: reservations.length,
                  itemBuilder: (context, index) {
                    final reservation = reservations[index];
                    final status = reservation['status'];

                    Color statusColor;
                    String statusText;

                    if (status == 'accepted') {
                      statusColor = lightColorScheme.tertiary;
                      statusText = 'تم القبول';
                    } else if (status == 'pending') {
                      statusColor = Colors.amber;
                      statusText = 'قيد الإنتظار';
                    } else {
                      statusColor = lightColorScheme.error;
                      statusText = 'تم الرفض';
                    }

                    return Card(
                      color: lightColorScheme.onSecondary,
                      margin: EdgeInsets.only(bottom: 12.h),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  reservation['workerName'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                    color: lightColorScheme.scrim,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: statusColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Text(
                                    statusText,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: statusColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              reservation['profession'],
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: lightColorScheme.secondary,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'تاريخ الحجز: ${reservation['date']}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: lightColorScheme.surface,
                              ),
                            ),
                            if (status == 'accepted') ...[
                              SizedBox(height: 12.h),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    // Navigate to chat page
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChatPage(
                                          workerName: reservation['workerName'],
                                          profession: reservation['profession'],
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.chat,
                                    color: lightColorScheme.onPrimary,
                                  ),
                                  label: Text(
                                    'دردشة',
                                    style: TextStyle(
                                      color: lightColorScheme.onPrimary,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: lightColorScheme.primary,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Temporary declaration to avoid compilation errors
// Will be replaced by the actual implementation
class ChatPage extends StatelessWidget {
  final String workerName;
  final String profession;

  const ChatPage({
    Key? key,
    required this.workerName,
    required this.profession,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
