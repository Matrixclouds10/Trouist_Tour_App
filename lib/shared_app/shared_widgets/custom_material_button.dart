import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';

class CustomMaterialButtonWidget extends StatelessWidget {
  const CustomMaterialButtonWidget({super.key, required this.text,required this.onPressed, this.backgroundColor, this.textColor, this.borderColor, this.elevation, this.height, this.minWidth, this.textSize});
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? elevation;
  final void Function()? onPressed;
  final double? height;
  final double? minWidth;
  final double? textSize;
  @override
  Widget build(BuildContext context) {
    return   MaterialButton(
      elevation: elevation ?? 0.0,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      height:height ??56.h,
      minWidth: minWidth ?? 343.w,
      color: backgroundColor ?? const Color(0xff009688),
      onPressed: onPressed,
      child:  Text(text,
        textScaleFactor: ScaleSize.textScaleFactor(context),
        style: TextStyle(
            fontSize:textSize ?? 17.sp,
            fontWeight: FontWeight.w400,
            color: textColor ?? Colors.white
        ),
      ),
    );
  }
}
