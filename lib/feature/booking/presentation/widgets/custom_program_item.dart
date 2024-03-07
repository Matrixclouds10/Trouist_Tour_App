import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/booking/data/models/booking_response.dart';
import 'package:tourist_tour_app/feature/booking/data/models/canceled_request.dart';
import 'package:tourist_tour_app/feature/booking/logic/booking_cubit.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_button.dart';

class CustomProgramItem extends StatelessWidget {
  const CustomProgramItem({super.key, required this.textButtonText, required this.onPressed, this.programResponse});
  final String textButtonText;
  final VoidCallback onPressed;
  final BookingResponse? programResponse;
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
                          Text(programResponse!.name!,
                            style: TextStyles.font17CustomBlack700WeightPoppins,
                              textScaleFactor: ScaleSize.textScaleFactor(context),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${programResponse!.newPrice!=null?programResponse!.newPrice!.toString():programResponse!.price!.toString()} ${'rs'.tr()}',
                                textScaleFactor: ScaleSize.textScaleFactor(context),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                                    color: AppColorLight.redColor),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height:15.h ,
                                    width:10.w ,
                                    child: Image.asset(AppImages.group,fit: BoxFit.cover,),

                                  ),
                                  horizontalSpace(5),
                                  Text('${programResponse!.groupType} ${'trip'.tr()}',
                                    textScaleFactor: ScaleSize.textScaleFactor(context),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyles.font12CustomGray400WeightLato.copyWith(
                                      color: AppColorLight.customBlack,
                                    ),
                                  ),

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
                                  Text('${programResponse!.duration!} ${'days'.tr()}',
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
                                    child: Text(programResponse!.region!,
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

              textButtonText!='cancel'.tr()?
                 textButtonText!='Review'?
                 SizedBox(
                     height: 40.h,
                     width:311.w ,
                     child: CustomTextButton(text: textButtonText, onPressed: onPressed,)):const SizedBox.shrink():
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                   children: [
                     SizedBox(
                         height: 40.h,
                         width:MediaQuery.of(context).size.width*0.4,
                         child: CustomTextButton(text: textButtonText, onPressed: onPressed,)),
                     SizedBox(
                         height: 40.h,
                         width:MediaQuery.of(context).size.width*0.4,
                         child: CustomTextButton(text: 'finish'.tr(), onPressed: (){
                           CanceledRequest canceledRequest=CanceledRequest(id: programResponse!.bookingId, notes: 'note');
                           BookingCubit.get(context).finishedProgram(canceledRequest,context);
                         },))
                   ],
                 ),
            ],
          ),
        ),
      ));
  }
}
