import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';

class CustomMoreItemWidget extends StatelessWidget {
  const CustomMoreItemWidget({super.key, this.iconPath, required this.function, this.hasArrowButton, this.lang, required this.tex, this.textColor});
  final String? iconPath;
  final  Function function;
  final  bool? hasArrowButton;
  final bool? lang;
  final String tex;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: InkWell(
        onTap: () {
          function();
        },
        child: Row(
          children: <Widget>[
            iconPath !=null? SizedBox(
                width: 24.w,
                child: Image.asset(iconPath!)):Image.asset('assets/images/person.png'),
            SizedBox(width: 8.w),
            Text(
              tex,
              style:TextStyles.font17Black400WightLato.copyWith(
                fontFamily: AppFontsFamily.fontPoppins,
                color: textColor?? AppColorLight.customBlack
              ),),
            const Spacer(),
            lang==true?
            SizedBox(
                width: 100.w,
                child: Row(
                  children: [
                    Container(
                      height:36.h ,
                      width: 41.w,
                      decoration:
                      context.locale==const Locale('en')?
                      BoxDecoration(
                           color:AppColorLight.primaryColor,
                          // border: Border.all(color:AuthCubit.get(context).localeLanguage==Locale('ar')? Color(0xff100E0D):Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(10.sp))
                      ):
                      BoxDecoration(
                          // color:AppColorLight.primaryColor,
                          border: Border.all(color: const Color(0xff929D9C)),
                          borderRadius: BorderRadius.all(Radius.circular(10.sp))
                      ),
                      child: Center(child: FittedBox(
                        child: Text('EN',
                          style: TextStyles.font17CustomGray400WightLato.copyWith(
                            fontFamily: AppFontsFamily.fontPoppins,
                            color: context.locale==const Locale('en')? Colors.white:null,
                          )
                        ),
                      )),
                    ),
                    SizedBox(width: 9.w,),
                    Container(
                      height:36.h ,
                      width: 42.w,
                      decoration:
                      context.locale==const Locale('en')?
                      BoxDecoration(
                        // color: AppColorLight.primaryColor,
                          border: Border.all(color:const Color(0xff929D9C)),
                          borderRadius: BorderRadius.all(Radius.circular(10.sp))
                      ):
                      BoxDecoration(
                          color: AppColorLight.primaryColor,
                          // border: Border.all(color:Color(0xff929D9C)),
                          borderRadius: BorderRadius.all(Radius.circular(10.sp))
                      ),
                      child:  Center(child: FittedBox(
                        child: Text('AR',
                          style: TextStyles.font17CustomGray400WightLato.copyWith(
                            fontFamily: AppFontsFamily.fontPoppins,
                              color:context.locale==const Locale('ar')? Colors.white:null,
                        )
                        ),
                      )),

                    ),
                  ],
                )):const SizedBox.shrink(),
            if (hasArrowButton != false)const Icon(Icons.arrow_forward_ios, color: AppColorLight.gray2)
            // SvgPicture.asset(IconsManager.profileArrow)
          ],
        ),
      ),
    );
  }
}
