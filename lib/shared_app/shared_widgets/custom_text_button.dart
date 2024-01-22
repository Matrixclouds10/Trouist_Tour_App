import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, required this.onPressed, this.textColor, this.backGround, this.width, this.height});
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? backGround;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor:backGround?? Colors.white, // button color
        // padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColorLight.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize:  Size(width?? 320,height?? 42.0), // set width and height
      ),
      child: Text(
        text,
        style:
        TextStyles.font17Black400WightLato.copyWith(
            color: textColor??AppColorLight.primaryColor,
           fontFamily: AppFontsFamily.fontPoppins
        )
      ),
    );
  }
}
