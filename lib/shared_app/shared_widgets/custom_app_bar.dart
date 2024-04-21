import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';


class CustomAppBar extends StatelessWidget {
  final String title;
  final bool? hasBackButton;
  final bool? hasCartButton;
  final Color? backGround;
  final IconData? icon;
 final void Function()? onTap;
 const CustomAppBar({super.key, required this.title, this.hasBackButton,this.onTap, this.hasCartButton, this.backGround, this.icon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.only(top: 17.h),
        child: Text(title,
          textScaleFactor: ScaleSize.textScaleFactor(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        style: TextStyles.font17CustomBlack500WeightPoppins,
        ),
      ),
      backgroundColor: backGround??Colors.white,
      titleTextStyle: TextStyles.font17CustomBlack500WeightPoppins,
      centerTitle: true,
      elevation: 0,
      // backgroundColor: primaryColor,
      leading: hasBackButton == true
          ? Padding(
              padding: EdgeInsets.only(top: 25.h, right: 16.w, left: 16.w),
              child: InkWell(
                  onTap: onTap??(){
                    Navigator.pop(context);
                  },
                  child:  Icon(icon??Icons.arrow_back_ios_rounded,
                  color: AppColorLight.gray2,
                  )
                  // SvgPicture.asset(IconsManager.backIcon),
              ),
            )
          : null,
    );
  }
}
