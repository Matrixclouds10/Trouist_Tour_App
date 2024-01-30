import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return

      MediaQuery(
        data: MediaQuery.of(context).copyWith(
      textScaleFactor: 1.0, ),
    child: Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size(double.infinity,62.h),
          child: const CustomAppBar(title:'About Us', hasBackButton: true,)),
      body: Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.w),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                  height: 150.h,
                  width: 150.w,
                  child: Image.asset(AppImages.logoPng)),
            ),
            Text('Lorem ipsum dolor sit amet consectetur. Maecenas adipiscing in enim a libero mollis nec semper. Consectetur fames tempus id posuere dapibus. Libero senectus eu ultricies a. Neque ante in consequat quisque nec arcu. In sed tristique enim ullamcorper. Pharetra aliquam arcu nullam feugiat nec turpis.',
            style: TextStyles.font14CustomWight700wLato.copyWith(
              color: AppColorLight.customBlack
            ),),
            verticalSpace(16),
            Text('Lorem ipsum dolor sit amet consectetur. Maecenas adipiscing in enim a libero mollis nec semper. Consectetur fames tempus id posuere dapibus .',
              style: TextStyles.font14CustomWight700wLato.copyWith(
                  color: AppColorLight.customBlack
              ),),
          ],
        ),
      ),

    ),
    );
  }
}
