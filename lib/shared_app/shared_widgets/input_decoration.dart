import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration customInputDecoration({
  required String hintText,
  IconButton? suffixIcon,
  double? borderRadius,
  String? hintFontFamily,
  TextStyle? hintStyle,
  Icon? prefixIcon,
  Color? hintColor,
  Color? borderColor,
  double? contentVerticalPadding,
  double? contentHorizontalPadding,
  FontWeight? fontWeight,
  double? fontSize,
  Color? fillColor,
  Color? prefixIconColor,
  bool? enabled,
}) {
  return InputDecoration(
    hintText: hintText,

    hintStyle: hintStyle??TextStyle(
      color: hintColor ?? Colors.grey,
      fontSize: fontSize ?? 12.sp,
      fontFamily: hintFontFamily,
      fontWeight: fontWeight ?? FontWeight.w400,
    ),
    enabled: enabled ?? true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
      borderSide: BorderSide(color: borderColor ?? Colors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
      borderSide: BorderSide(color: borderColor ?? Colors.grey),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
      borderSide: BorderSide(color: borderColor ?? Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
      borderSide: BorderSide(color: borderColor ?? Colors.grey),
    ),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8.r)),
    fillColor: fillColor??Colors.white,
    filled: true,
    contentPadding: EdgeInsets.symmetric(
        vertical: contentVerticalPadding ?? 5.h,
        horizontal: contentHorizontalPadding ?? 8.w),
    suffixIcon: suffixIcon != null
        ? Padding(
      padding: EdgeInsets.only(left: 12.w, right: 12.w),
      child: (suffixIcon),
    )
        : null,
    prefixIcon: prefixIcon != null
        ? Padding(
      padding: EdgeInsets.only(left: 12.w, right: 12.w),
      child: prefixIcon,
    )
        : null,
  );
}
