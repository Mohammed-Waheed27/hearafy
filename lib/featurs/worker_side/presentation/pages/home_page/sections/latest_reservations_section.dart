import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mw_herafy/theme/color/app_theme.dart';

class LatestReservationsSection extends StatelessWidget {
  const LatestReservationsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock reservation data - in a real app this would come from a repository
    final List<Map<String, dynamic>> reservations = [
      {
        'id': '1',
        'customerName': 'أحمد محمد',
        'service': 'إصلاح حنفية',
        'location': 'طنطا - شارع البحر',
        'date': '15 مايو 2025',
        'time': '2:30 مساءً',
        'status': 'pending',
      },
      {
        'id': '2',
        'customerName': 'سمير علي',
        'service': 'تركيب مواسير جديدة',
        'location': 'المنصورة - شارع الجامعة',
        'date': '16 مايو 2025',
        'time': '10:00 صباحاً',
        'status': 'pending',
      },
      {
        'id': '3',
        'customerName': 'محمد خالد',
        'service': 'إصلاح تسرب',
        'location': 'ميت غمر - شارع الجلاء',
        'date': '17 مايو 2025',
        'time': '4:00 مساءً',
        'status': 'pending',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "أحدث الطلبات",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: lightColorScheme.scrim,
                  ),
            ),
            TextButton(
              onPressed: () {
                // Navigate to all reservations page
              },
              child: Text(
                "عرض الكل",
                style: TextStyle(
                  color: lightColorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        reservations.isEmpty
            ? _buildEmptyState(context)
            : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reservations.length,
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final reservation = reservations[index];
                  return _buildReservationCard(context, reservation);
                },
              ),
      ],
    );
  }

  Widget _buildReservationCard(
      BuildContext context, Map<String, dynamic> reservation) {
    return Container(
      decoration: BoxDecoration(
        color: lightColorScheme.onPrimary,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      reservation['customerName'],
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: lightColorScheme.scrim,
                          ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: lightColorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        "طلب جديد",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: lightColorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                _buildInfoRow(
                  context,
                  Icons.home_repair_service,
                  "الخدمة: ${reservation['service']}",
                ),
                SizedBox(height: 8.h),
                _buildInfoRow(
                  context,
                  Icons.location_on,
                  "الموقع: ${reservation['location']}",
                ),
                SizedBox(height: 8.h),
                _buildInfoRow(
                  context,
                  Icons.calendar_today,
                  "التاريخ: ${reservation['date']} - ${reservation['time']}",
                ),
              ],
            ),
          ),
          Divider(height: 1, color: lightColorScheme.outline),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Handle reject reservation
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: lightColorScheme.error,
                      side: BorderSide(color: lightColorScheme.error),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: const Text("رفض"),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle accept reservation
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightColorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: const Text("قبول"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16.w,
          color: lightColorScheme.primary,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: lightColorScheme.surface,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 32.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calendar_today_outlined,
            size: 48.w,
            color: lightColorScheme.surface,
          ),
          SizedBox(height: 16.h),
          Text(
            "لا توجد طلبات جديدة",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: lightColorScheme.surface,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 8.h),
          Text(
            "ستظهر هنا الطلبات الجديدة عندما يقوم العملاء بحجز خدماتك",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: lightColorScheme.surface,
                ),
          ),
        ],
      ),
    );
  }
}
