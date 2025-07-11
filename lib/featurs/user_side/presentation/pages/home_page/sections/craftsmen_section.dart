import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../theme/color/app_theme.dart';

class CraftsmenSection extends StatelessWidget {
  const CraftsmenSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'عرض الكل',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: lightColorScheme.primary,
                    ),
              ),
            ),
            Text(
              'حرفيين شائعين',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 320.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyCraftsmen.length,
            itemBuilder: (context, index) {
              return CraftsmanCard(craftsman: dummyCraftsmen[index]);
            },
          ),
        ),
      ],
    );
  }
}

class Craftsman {
  final String name;
  final String profession;
  final String imageUrl;
  final int completedWorks;
  final String workingHours;

  Craftsman({
    required this.name,
    required this.profession,
    required this.imageUrl,
    required this.completedWorks,
    required this.workingHours,
  });
}

final List<Craftsman> dummyCraftsmen = [
  Craftsman(
    name: 'أحمد محمد',
    profession: 'كهربائي',
    imageUrl: 'assets/images/w.jpg',
    completedWorks: 156,
    workingHours: '09:00-17:00',
  ),
  Craftsman(
    name: 'محمود علي',
    profession: 'سباك',
    imageUrl: 'assets/images/w3.jpg',
    completedWorks: 89,
    workingHours: '08:00-16:00',
  ),
  Craftsman(
    name: 'حسن إبراهيم',
    profession: 'نجار',
    imageUrl: 'assets/images/w2.jpg',
    completedWorks: 234,
    workingHours: '10:00-18:00',
  ),
  Craftsman(
    name: 'عمر خالد',
    profession: 'دهان',
    imageUrl: 'assets/images/w3.jpg',
    completedWorks: 167,
    workingHours: '08:30-16:30',
  ),
  Craftsman(
    name: 'ياسر أحمد',
    profession: 'حداد',
    imageUrl: 'assets/images/w.jpg',
    completedWorks: 145,
    workingHours: '07:00-15:00',
  ),
  Craftsman(
    name: 'كريم محمد',
    profession: 'مبلط',
    imageUrl: 'assets/images/w2.jpg',
    completedWorks: 198,
    workingHours: '09:30-17:30',
  ),
];

class CraftsmanCard extends StatelessWidget {
  final Craftsman craftsman;

  const CraftsmanCard({
    super.key,
    required this.craftsman,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      width: 200.w,
      margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: lightColorScheme.onPrimary,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 150.h,
            width: 150.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: AssetImage(craftsman.imageUrl),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    craftsman.name,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: lightColorScheme.primary,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 4.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    craftsman.profession,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: lightColorScheme.secondary,
                        ),
                  ),
                ),
                SizedBox(height: 8.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'عدد الأعمال: ${craftsman.completedWorks}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: lightColorScheme.onSecondary,
                            fontSize: 10.sp,
                          ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${craftsman.workingHours} الوقت المُتاح للعمل',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: lightColorScheme.onSecondary,
                            fontSize: 10.sp,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
