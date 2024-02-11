import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';

void showCustomDialog({String? title ,String? des ,String? bt1,String? bt2 ,void Function()? onPressed1,void Function()? onPressed2,BuildContext? context}) {
  showDialog(
    context: context!,
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text(title!,
          style: TextStyles.font17CustomBlack700WeightPoppins,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppImages.logoSvg,width: 100,),
            verticalSpace(10),
            Text(des!,
              style: TextStyles.font12CustomGray400WeightLato.copyWith(
                  color: AppColorLight.customBlack,
                  fontFamily: AppFontsFamily.fontPoppins,
                  fontWeight: FontWeight.w700,
                  fontSize: 14
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(bt2!,
              style: TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                  color: AppColorLight.primaryColor.withOpacity(0.8)
              ),
            ),
          ),
          TextButton(
            onPressed:onPressed1!,
            child: Text(bt1!,
              style: TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                  color: AppColorLight.primaryColor
              ),
            ),
          ),
        ],
      );
    },
  );
}
