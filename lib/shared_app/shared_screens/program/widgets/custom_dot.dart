import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';

class CustomDot extends StatelessWidget {
  const CustomDot({super.key, this.height, this.width, this.color});
  final double? height;
  final double? width;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(5.0),
      child: Container(
        height: height?? 8.w,
        width: width?? 8.w,
        decoration:  BoxDecoration(
            color: color??AppColorLight.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
      ),
    );
  }
}
