import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_field.dart';

class RateScreen extends StatelessWidget {
  const RateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size(double.infinity,62.h),
          child: const CustomAppBar(title:'Review', hasBackButton: true,)),
      body: Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.w),
        child: SingleChildScrollView (
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               verticalSpace(40),
               Center(
                   child: Image.asset(AppImages.rate)),
               verticalSpace(32),
              Text('Send Your Feedback !',
                textScaleFactor: ScaleSize.textScaleFactor(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              style: TextStyles.font24CustomBlack700WeightPoppins.copyWith(
                fontFamily: AppFontsFamily.fontPoppins
              ),),
              verticalSpace(8),
              Text('It is a long established fact that a reader will be distracted by the readab .',
                textScaleFactor: ScaleSize.textScaleFactor(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font17Black400WightLato.copyWith(
                    color: AppColorLight.customBlack
                ),),
              verticalSpace(32),
              Text('How Was Your Experience ? ',
                textScaleFactor: ScaleSize.textScaleFactor(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font17Black400WightLato.copyWith(
                    color: AppColorLight.customBlack,
                    fontFamily: AppFontsFamily.fontPoppins
          
                ),),
              verticalSpace(8),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 10),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              verticalSpace(20),
              CustomTextField(
                  contentHorizontalPadding:20,
                  contentVerticalPadding: 20,
                  fillColor:AppColorLight.grayBackGroundColor,
                  borderColor:AppColorLight.grayBackGroundColor,
                  maxLines: 6,
                  hintText: 'Send Your Feedback Here.....',
                  controller: TextEditingController()),
              verticalSpace(73),
              CustomMaterialButtonWidget(
                  text: 'Send Feedback',
                  onPressed: (){}),
              verticalSpace(50),







            ],),
        ),
      ),

    );
  }
}
