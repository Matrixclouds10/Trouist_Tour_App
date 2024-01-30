import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';

class CustomDetailsOfCounterWidget extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;
  const CustomDetailsOfCounterWidget({super.key, required this.text1, required this.text2, required this.text3});

  @override
  State<CustomDetailsOfCounterWidget> createState() => _CustomDetailsOfCounterWidgetState();
}

class _CustomDetailsOfCounterWidgetState extends State<CustomDetailsOfCounterWidget> {
  int counter1 =0;
  int counter2 =0;
  int counter3 =0;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text1,
          style: TextStyles.font17Black400WightLato.copyWith(
              color: AppColorLight.customBlack
          ),),
        verticalSpace(8),
        Container(
          width: 343.w,
          height: 56.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColorLight.customGray.withOpacity(0.70))
          ),
          child: Padding(
            padding:  EdgeInsets.only(left: 16.w,right: 16.w),
            child: Row(
              children: [
                Text(counter1.toString(),
                  style: TextStyles.font18CustomBlack600Weight.copyWith(
                      fontSize: 24.sp,
                      fontFamily: AppFontsFamily.fontLato
                  ),
                ),
                const Spacer(),
                Container(
                  width: 25.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColorLight.customGray.withOpacity(0.70))
                  ),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        if(counter1>0){
                          counter1--;
                        }
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0,right: 8.0),
                      child: Center(child: Divider(color: AppColorLight.customGray,thickness: 2,)),
                    ),
                  ),
                ),
                horizontalSpace(10),
                Text(counter1.toString(),
                  style: TextStyles.font14CustomGray400w.copyWith(
                      fontSize: 24.sp,
                      fontFamily: AppFontsFamily.fontCairo
                  ),),
                horizontalSpace(10),
                Container(
                  width: 25.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColorLight.customGray.withOpacity(0.70))
                  ),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        counter1++;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 1.0),
                      child: Center(child: Text('+',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color:  AppColorLight.customGray,
                        ),
                      )),
                    ),
                  ),

                ),
              ],
            ),
          ),
        ),
        verticalSpace(16),
        Text(widget.text2,
          style: TextStyles.font17Black400WightLato.copyWith(
              color: AppColorLight.customBlack
          ),),
        verticalSpace(8),
        Container(
          width: 343.w,
          height: 56.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColorLight.customGray.withOpacity(0.70))
          ),
          child: Padding(
            padding:  EdgeInsets.only(left: 16.w,right: 16.w),
            child: Row(
              children: [
                Text(counter2.toString(),
                  style: TextStyles.font18CustomBlack600Weight.copyWith(
                      fontSize: 24.sp,
                      fontFamily: AppFontsFamily.fontLato
                  ),
                ),
                const Spacer(),
                Container(
                  width: 25.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColorLight.customGray.withOpacity(0.70))
                  ),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        if(counter2>0){
                          counter2--;
                        }
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0,right: 8.0),
                      child: Center(child: Divider(color: AppColorLight.customGray,thickness: 2,)),
                    ),
                  ),
                ),
                horizontalSpace(10),
                Text(counter2.toString(),
                  style: TextStyles.font14CustomGray400w.copyWith(
                      fontSize: 24.sp,
                      fontFamily: AppFontsFamily.fontCairo
                  ),),
                horizontalSpace(10),
                Container(
                  width: 25.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColorLight.customGray.withOpacity(0.70))
                  ),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        counter2++;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 1.0),
                      child: Center(child: Text('+',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color:  AppColorLight.customGray,
                        ),
                      )),
                    ),
                  ),

                ),
              ],
            ),
          ),
        ),
        verticalSpace(16),
        Text(widget.text3,
          style: TextStyles.font17Black400WightLato.copyWith(
              color: AppColorLight.customBlack
          ),),
        verticalSpace(8),
        Container(
          width: 343.w,
          height: 56.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColorLight.customGray.withOpacity(0.70))
          ),
          child: Padding(
            padding:  EdgeInsets.only(left: 16.w,right: 16.w),
            child: Row(
              children: [
                Text(counter3.toString(),
                  style: TextStyles.font18CustomBlack600Weight.copyWith(
                      fontSize: 24.sp,
                      fontFamily: AppFontsFamily.fontLato
                  ),
                ),
                const Spacer(),
                Container(
                  width: 25.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColorLight.customGray.withOpacity(0.70))
                  ),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        if(counter3>0){
                          counter3--;
                        }
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0,right: 8.0),
                      child: Center(child: Divider(color: AppColorLight.customGray,thickness: 2,)),
                    ),
                  ),
                ),
                horizontalSpace(10),
                Text(counter3.toString(),
                  style: TextStyles.font14CustomGray400w.copyWith(
                      fontSize: 24.sp,
                      fontFamily: AppFontsFamily.fontCairo
                  ),),
                horizontalSpace(10),
                Container(
                  width: 25.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColorLight.customGray.withOpacity(0.70))
                  ),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        counter3++;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 1.0),
                      child: Center(child: Text('+',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color:  AppColorLight.customGray,
                        ),
                      )),
                    ),
                  ),

                ),
              ],
            ),
          ),
        ),
        verticalSpace(32),
      ],
    );
  }
}
