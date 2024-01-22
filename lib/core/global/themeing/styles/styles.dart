
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';

class TextStyles{

  static TextStyle font24CustomBlack700Weight = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColorLight.customBlack,

  );
  static TextStyle font17CustomBlack700WeightPoppins = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w700,
    color: AppColorLight.customBlack,
    fontFamily: AppFontsFamily.fontPoppins
  );
  static TextStyle font18CustomBlack600Weight = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    fontFamily: AppFontsFamily.fontLato,
    color: AppColorLight.customBlack
  );
  static TextStyle font17CustomBlack500WeightPoppins = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w700,
    fontFamily:AppFontsFamily.fontPoppins ,
    color: AppColorLight.customBlack
  );

  static TextStyle font12CustomGray400WeightLato = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
      fontFamily: AppFontsFamily.fontLato,
      color: AppColorLight.customGray
  );static TextStyle font12CustomRed500WeightLato = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColorLight.redColor,
    fontFamily: AppFontsFamily.fontLato
  );
  static TextStyle font14CustomBlack500w = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColorLight.customBlack
  );
  static TextStyle font14CustomGray400w = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColorLight.customGray
  );

  static TextStyle font17CustomGray400Wight = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
    color: AppColorLight.customGray
  );
  static TextStyle font17Black400WightLato = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
    color: AppColorLight.black,
    fontFamily: AppFontsFamily.fontLato
  );


}