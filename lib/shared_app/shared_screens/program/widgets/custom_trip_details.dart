import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_dot.dart';

class CustomTripDetailsWidget extends StatelessWidget {
  const CustomTripDetailsWidget({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return           Container(
      height:320.h ,
      width: 343.w,
      decoration: BoxDecoration(
          color: color ?? AppColorLight.customGray.withOpacity(0.10),
          borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(13),
            Text('Trip Details',
              style: TextStyles.font17CustomBlack700WeightPoppins,
            ),
            verticalSpace(13),
            Expanded(
              child: Row(
                children: [
                  Column(
                    children: [
                      Text('Day 1 \nOCT 4',
                        style: TextStyles.font12CustomGray400WeightLato.copyWith(
                            color: AppColorLight.customBlack
                        ),
                      ),
                      verticalSpace(54),
                      Text('Day 2 \nOCT 5',
                        style: TextStyles.font12CustomGray400WeightLato.copyWith(
                            color: AppColorLight.customBlack
                        ),
                      ),
                      verticalSpace(60),
                      Text('Day 3 \nOCT 6',
                        style: TextStyles.font12CustomGray400WeightLato.copyWith(
                            color: AppColorLight.customBlack
                        ),
                      ),
                    ],
                  ),
                  horizontalSpace(24),
                  Column(
                    children: [
                      verticalSpace(10),
                      const CustomDot(),
                      SizedBox(
                        height: 76.h,
                        child: const VerticalDivider(thickness: 1,color: AppColorLight.primaryColor,),
                      ),
                      const CustomDot(),
                      SizedBox(
                        height: 76.h,
                        child: const VerticalDivider(thickness: 1,color: AppColorLight.primaryColor,),
                      ), const CustomDot(),
                      SizedBox(
                        height: 30.h,
                        child: const VerticalDivider(thickness: 1,color: AppColorLight.primaryColor,),
                      ),

                    ],
                  ),
                  horizontalSpace(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(10),
                      Text('Arrival To Mecca',
                        style: TextStyles.font17Black400WightLato.copyWith(
                            color: AppColorLight.customBlack
                        ),
                      ),
                      verticalSpace(65),
                      Text('Arrival To Medina',
                        style: TextStyles.font17Black400WightLato.copyWith(
                            color: AppColorLight.customBlack
                        ),
                      ),
                      verticalSpace(65),
                      Text('Return To Mecca',
                        style: TextStyles.font17Black400WightLato.copyWith(
                            color: AppColorLight.customBlack
                        ),
                      ),
                      Text('Show Location',
                        style: TextStyles.font17Black400WightLato.copyWith(
                          color: AppColorLight.customGray,
                        ),

                      ),
                    ],
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
