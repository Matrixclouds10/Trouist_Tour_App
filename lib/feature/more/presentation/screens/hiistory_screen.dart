import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1.0, ),
      child: Scaffold(
        appBar:  PreferredSize(
            preferredSize: Size(double.infinity,62.h),
            child: const CustomAppBar(title:'Your Program History', hasBackButton: true,)),
        body: Padding(
          padding:  EdgeInsets.only(left: 16.w,right: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(80),
                Center(
                  child: SizedBox(
                      height: 250.h,
                      width: 270.w,
                      child: Image.asset(AppImages.history)),
                ),
                verticalSpace(20),
                Text('your Program History Will Show Here',
                  style: TextStyles.font14CustomWight700wLato.copyWith(
                      color: AppColorLight.customBlack
                  ),),

              ],
            ),
          ),
        ),

      ),
    );
  }
}
