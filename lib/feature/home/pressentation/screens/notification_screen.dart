import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size(double.infinity,62.h),
          child: const CustomAppBar(title:'Notifications', hasBackButton: true,)),
      body: Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.w),
        child: Column(
          children: [
            verticalSpace(20),
            Container(
              height: 79.h,
              width: 343.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColorLight.customGray)
              ),
              child: Row(
                children: [
                  horizontalSpace(10),
                  Image.asset(AppImages.trueImage),
                  horizontalSpace(8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('your Trip Has Been Confirmed ',
                      style: TextStyles.font17Black400WightLato.copyWith(
                        color: AppColorLight.customBlack
                      ),
                      ),
                      Text('5 Min Ago',
                      style: TextStyles.font12CustomGray400WeightLato,
                      ),
                    ],
                  )


                ],
              ),
            ),
            verticalSpace(16),
            Container(
              height: 79.h,
              width: 343.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColorLight.customGray)
              ),
              child: Row(
                children: [
                  horizontalSpace(10),
                  Image.asset(AppImages.falseImage),
                  horizontalSpace(8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('your Trip Have Been Cancelled ',
                        style: TextStyles.font17Black400WightLato.copyWith(
                            color: AppColorLight.customBlack
                        ),
                      ),
                      Text('10 Min Ago',
                        style: TextStyles.font12CustomGray400WeightLato,
                      ),
                    ],
                  )


                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
