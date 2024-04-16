import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/home/data/models/notification_response.dart';
import 'package:tourist_tour_app/feature/home/pressentation/widgets/custom_avatar_grow.dart';

class CustomNotificationItem extends StatelessWidget {
  const CustomNotificationItem({super.key, required this.notificationResponse});
  final NotificationResponse notificationResponse;
  @override
  Widget build(BuildContext context) {
    // تاريخ الآن
    DateTime now = DateTime.now();

    // تاريخ معين
    DateTime createdAt = DateTime.parse("${notificationResponse.createdAt}");

    // حساب الفرق بين الوقت الحالي وتاريخ الإنشاء
    Duration difference = now.difference(createdAt);

    // حساب عدد الأيام
    int days = difference.inDays;

    // حساب عدد الساعات باستثناء الأيام
    int hours = difference.inHours - days * 24;

    // حساب عدد الدقائق باستثناء الأيام والساعات
    int minutes = difference.inMinutes - days * 24 * 60 - hours * 60;

    // حساب عدد الثواني باستثناء الأيام والساعات والدقائق
    int seconds = difference.inSeconds - days * 24 * 60 * 60 - hours * 60 * 60 - minutes * 60;
    String? time;
    if(days==0){

    }else{
      time= '${'since'.tr()} : ${'$days${'day'.tr()} , ${hours}h:${minutes}m:${seconds}s'}';
    }
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [BoxShadow(color: Colors.black38,blurRadius: 2,offset: Offset(3, 3))],
            border: Border.all(color: AppColorLight.customGray)
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 5.w),
          child: Row(
            children: [
              horizontalSpace(10),
              const CustomAvatarGrowWidget(glowColor: AppColorLight.primaryColor, icon: Icons.notifications_active_outlined,),
              horizontalSpace(20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notificationResponse.data!.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font17CustomBlack500WeightPoppins.copyWith(
                        color: AppColorLight.customBlack,
                        fontWeight: FontWeight.w700,
                        fontSize: 17.sp
                    ),
                  ),
                  Text(notificationResponse.data!.message!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font12CustomGray400WeightLato.copyWith(
                        fontFamily: AppFontsFamily.fontPoppins,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp
                    ),
                  ),
                  //"الفرق في الوقت: $days أيام, $hours ساعات, $minutes دقائق, $seconds ثواني"
                  // Text(
                  //   '${days!=0?'$days${'day'.tr()} , ':''}${hours!=0?'$hours${'hours'.tr()} ':''}:${minutes!=0?'$minutes${'minutes'.tr()} ':''}:${seconds!=0?'$seconds${'seconds'.tr()} ':''} ${'ago'.tr()}',
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyles.font12CustomGray400WeightLato.copyWith(
                  //     fontFamily: AppFontsFamily.fontPoppins,
                  //       fontWeight: FontWeight.w500,
                  //       color: AppColorLight.customGray.withOpacity(0.8),
                  //       fontSize: 10.sp
                  //   ),
                  // ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
