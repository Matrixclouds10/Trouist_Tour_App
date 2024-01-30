import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_bottom_sheet.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_button.dart';

class CustomProgramItem extends StatelessWidget {
  const CustomProgramItem({super.key, required this.textButtonText, required this.onPressed});
  final String textButtonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  EdgeInsets.only(left: 16.w,right: 16.w,top: 16.h),
      child: Container(
        height: 162.h,
        width: 343.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColorLight.customGray.withOpacity(0.4))
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: 16.w,right: 16.w),
          child: Column(
            children: [
              verticalSpace(14),
              Row(
                children: [
                  SizedBox(
                      height: 75,
                      width: 105.w,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(AppImages.test2,fit: BoxFit.cover,))),
                  horizontalSpace(8),
                  SizedBox(
                      width: 190.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Religious Program',
                            style: TextStyles.font17CustomBlack700WeightPoppins,
                              textScaleFactor: ScaleSize.textScaleFactor(context),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Text('1000 RS',
                                textScaleFactor: ScaleSize.textScaleFactor(context),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                                    color: AppColorLight.redColor),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  SizedBox(
                                    height:15.h ,
                                    width:10.w ,
                                    child: Image.asset(AppImages.group,fit: BoxFit.cover,),

                                  ),
                                  horizontalSpace(5),
                                  Text('Group Trip',
                                    textScaleFactor: ScaleSize.textScaleFactor(context),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font12CustomGray400WeightLato.copyWith(
                                      color: AppColorLight.customBlack,
                                    ),
                                  ),
                                  horizontalSpace(25),

                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height:16.h ,
                                    width:15.w ,
                                    child: Image.asset(AppImages.returnCloc,fit: BoxFit.cover,),
                                  ),
                                  horizontalSpace(4),
                                  Text('3 Days',
                                    textScaleFactor: ScaleSize.textScaleFactor(context),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font12CustomGray400WeightLato.copyWith(
                                      color: AppColorLight.customBlack,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  const Center(
                                    child: Icon(Icons.location_on_outlined,
                                      color: AppColorLight.gray2,size: 18,),
                                  ),
                                  horizontalSpace(1),
                                  SizedBox(
                                    child: Text('Mecca , Medina',
                                      textScaleFactor: ScaleSize.textScaleFactor(context),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.font12CustomGray400WeightLato.copyWith(
                                        color: AppColorLight.customBlack,
                                      ),
                                    ),

                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                ],
              ),
              verticalSpace(10),
              SizedBox(
                  height: 40.h,
                  width:311.w ,
                  child: CustomTextButton(text: textButtonText, onPressed: onPressed,)),




            ],
          ),
        ),
      ));
  }
}
