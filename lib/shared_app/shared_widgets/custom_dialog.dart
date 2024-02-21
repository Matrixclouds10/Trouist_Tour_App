
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';

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
          MaterialButton(
            color: AppColorLight.primaryColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(bt2!,
              style: TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                  color: Colors.white
              ),
            ),
          ),
          MaterialButton(
            color: AppColorLight.primaryColor,
            onPressed:onPressed1!,
            child: Text(bt1!,
              style: TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                  color: Colors.white
              ),
            ),
          ),
        ],
      );
    },
  );
}
void showCustomDialog2({String? title ,String? des ,String? bt1,String? bt2 ,void Function()? onPressed1,void Function()? onPressed2,BuildContext? context}) {
  showDialog(
    context: context!,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent, // Set the background color to transparent
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Customize the background color here
            borderRadius: BorderRadius.circular(8.0), // You can adjust the border radius as needed
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(
                height: 300.h,
                width: 343.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      bt1!,
                      // AppImages.dialog,
                      width: 291.w,
                      height: 217.h,
                    ),
                    verticalSpace(10),
                    Text(
                      des!,
                      style: TextStyles.font12CustomGray400WeightLato.copyWith(
                          color: AppColorLight.customBlack,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFontsFamily.fontCairo,
                          fontSize: 17
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomMaterialButtonWidget(
                    minWidth: 200,
                    height: 40,
                    text: bt2!, onPressed:onPressed1),
              ),
              const SizedBox(height: 30,)
            ],
          ),
        ),
      );
    },
  );

}
