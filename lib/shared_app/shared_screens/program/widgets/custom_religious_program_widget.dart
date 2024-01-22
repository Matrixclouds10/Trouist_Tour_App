import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_description_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_dot.dart';

class CustomReligiousProgramWidget extends StatelessWidget {
  const CustomReligiousProgramWidget({super.key, required this.isHasDes, this.type});
   final  bool isHasDes;
   final String? type;
  @override
  Widget build(BuildContext context) {
    return   Container(
      height:
      type!=null?
      270.h:
      isHasDes==true?
      235.h:150.h ,
      decoration:  isHasDes==true?
      BoxDecoration(
          color: AppColorLight.customGray.withOpacity(0.10),
          borderRadius: const BorderRadius.all(Radius.circular(10))
      ):null,
      width: 343.w,
      child: Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(type!=null?16:3),
            type!=null?
            Row(children: [
              CustomDot(height: 16.w,
              width: 16.w,
                color: type=='Up Coming'?const Color(0xffF59F01):type=='Completed'?AppColorLight.primaryColor:type=='Canceled'?const Color(0xffFF3A3A):null,
              ),
              Text(
              type!,
              style: TextStyles.font17CustomBlack500WeightPoppins.copyWith(
                fontWeight: FontWeight.w400,
                color: type=='Up Coming'?const Color(0xffF59F01):type=='Completed'?AppColorLight.primaryColor:type=='Canceled'?const Color(0xffFF3A3A):null,
              ),
              ),
              // type=='Canceled'?Icon(Icons.lo):const SizedBox.shrink(),

            ],):
            const SizedBox.shrink(),
            verticalSpace(5),
            Row(
              children: [
                Text('Religious Program',
                  style: TextStyles.font17CustomBlack700WeightPoppins,
                ),
                const Spacer(),
                Text('(150 Review)',
                  style: TextStyles.font12CustomRed500WeightLato.copyWith(color: AppColorLight.desColor),
                ),
                horizontalSpace(2),
                Text('4.8',
                  style: TextStyles.font18CustomBlack600Weight.copyWith(
                      fontFamily: AppFontsFamily.fontCairo
                  ),
                ),
                const Icon(Icons.star,color: AppColorLight.starColor,),
              ],
            ),
            Row(
              children: [
                Text('1000 RS',
                  style: TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColorLight.redColor,
                      color: AppColorLight.redColor),
                ),
                horizontalSpace(5),
                Text('1000 RS',
                  style: TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                      color: AppColorLight.desColor),
                ),
                const Spacer(),
              ],
            ),
            verticalSpace(8),
           isHasDes==true?
           Expanded(
             child: Column(
               children: [
                 const CustomDescriptionWidget(text: 'Lorem ipsum dolor sit amet consectetur. Facilisi nam quam tellus etiam non ut vel at magna. Felis porta fermentum .', maxLines: 3,),
                 verticalSpace(8),
               ],
             ),
           ):const SizedBox.shrink(),
            Row(
              children: [
                Row(
                  children: [
                    Image.asset(AppImages.returnCloc),
                    horizontalSpace(5),
                    Text('3 Days',
                      style: TextStyles.font17Black400WightLato.copyWith(
                        color: AppColorLight.black,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,color: AppColorLight.gray2,),
                    horizontalSpace(5),
                    Container(
                      width: 120.w,
                      child: Text('Mecca , Medina',
                        style: TextStyles.font17Black400WightLato.copyWith(
                          color: AppColorLight.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(5),
            Row(
              children: [
                Row(
                  children: [
                    Image.asset(AppImages.group),
                    horizontalSpace(5),
                    Text('Group Trip',
                      style: TextStyles.font17Black400WightLato.copyWith(
                        color: AppColorLight.black,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Image.asset(AppImages.person),
                    horizontalSpace(5),
                    SizedBox(
                      width: 120.w,
                      child: Text('10 Persons',
                        style: TextStyles.font17Black400WightLato.copyWith(
                          color: AppColorLight.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(13),
          ],
        ),
      ),
    );
  }
}
