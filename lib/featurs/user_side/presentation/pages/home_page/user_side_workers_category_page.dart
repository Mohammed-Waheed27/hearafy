import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mw_herafy/featurs/user_side/presentation/pages/home_page/widgets/user_side_worker_card.dart';
import 'package:mw_herafy/theme/color/app_theme.dart';

class UserSideWorkersCategoryPage extends StatelessWidget {
  const UserSideWorkersCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Artisan> plumbers = [
      Artisan(
        name: "محمد سعيد",
        yearsExperience: 7,
        rating: 4.8,
        phone: "01011223344",
        completedWorks: 220,
        bio: "تركيب جميع أنواع المواسير بمواد ألمانية مع ضمان 5 سنوات",
      ),
      Artisan(
        name: "أحمد مرسي",
        yearsExperience: 12,
        rating: 4.9,
        phone: "01022334455",
        completedWorks: 340,
        bio: "إصلاح تسريبات المياه المعقدة بأساليب حديثة",
      ),
      Artisan(
        name: "عمرو عبد الله",
        yearsExperience: 5,
        rating: 4.6,
        phone: "01033445566",
        completedWorks: 180,
        bio: "تركيب حنفيات ذكية وأنظمة ترشيد المياه",
      ),
      Artisan(
        name: "خالد محمود",
        yearsExperience: 9,
        rating: 4.7,
        phone: "01044556677",
        completedWorks: 260,
        bio: "صيانة مضخات المياه وتركيب سخانات",
      ),
      Artisan(
        name: "ياسر نبيل",
        yearsExperience: 15,
        rating: 5.0,
        phone: "01055667788",
        completedWorks: 400,
        bio: "خبير في أنظمة الصرف الصحي للمباني الكبيرة",
      ),
      Artisan(
        name: "طارق فكري",
        yearsExperience: 6,
        rating: 4.5,
        phone: "01066778899",
        completedWorks: 200,
        bio: "إصلاح أعطال السباكة الطارئة خلال ساعتين",
      ),
      Artisan(
        name: "علي حسن",
        yearsExperience: 8,
        rating: 4.8,
        phone: "01077889900",
        completedWorks: 280,
        bio: "تركيب أنظمة الري الحديثة للحدائق",
      ),
      Artisan(
        name: "مصطفى كمال",
        yearsExperience: 10,
        rating: 4.9,
        phone: "01088990011",
        completedWorks: 320,
        bio: "تحديث شبكات المياه القديمة وفق المواصفات القياسية",
      ),
      Artisan(
        name: "ناصر صلاح",
        yearsExperience: 4,
        rating: 4.4,
        phone: "01099001122",
        completedWorks: 150,
        bio: "تركيب أحواض ومغاسل بتصميمات عصرية",
      ),
      Artisan(
        name: "سعيد عبد العزيز",
        yearsExperience: 11,
        rating: 4.7,
        phone: "01000112233",
        completedWorks: 290,
        bio: "صيانة خزانات المياه العلوية والأرضية",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightColorScheme.onPrimary,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        // here im using the selected catgory
        title: Text(
          "the category that was chosen",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: lightColorScheme.primary),
        ),
      ),
      backgroundColor: lightColorScheme.onPrimary,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // the secoundary text indicating the work kind
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "سباك",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: lightColorScheme.scrim, fontSize: 18.sp),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 750.h,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.8,
                        mainAxisExtent: 240.h),
                    itemCount: plumbers.length,
                    itemBuilder: (context, index) {
                      return UserSideWorkerCard(
                        jop: plumbers[index].phone.toString(),
                        name: plumbers[index].name,
                        exp: plumbers[index].yearsExperience.toString(),
                        rating: plumbers[index].rating.toString(),
                      );
                    }),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class Artisan {
  final String name;
  final int yearsExperience;
  final double rating;
  final String phone;
  final int completedWorks;
  final String bio;

  Artisan({
    required this.name,
    required this.yearsExperience,
    required this.rating,
    required this.phone,
    required this.completedWorks,
    required this.bio,
  });
}
