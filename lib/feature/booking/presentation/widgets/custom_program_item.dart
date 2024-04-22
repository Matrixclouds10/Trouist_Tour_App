import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/localization/appLocale.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/booking/data/models/booking_response.dart';
import 'package:tourist_tour_app/feature/booking/data/models/canceled_request.dart';
import 'package:tourist_tour_app/feature/booking/logic/booking_cubit.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_dialog.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_button.dart';

import '../../data/models/booking_request.dart';
import '../screens/rate_screen.dart';

class CustomProgramItem extends StatelessWidget {
  const CustomProgramItem({super.key, required this.textButtonText, required this.onPressed, this.programResponse, this.type});
  final String textButtonText;
  final String? type;
  final VoidCallback onPressed;
  final BookingResponse? programResponse;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  EdgeInsets.only(left: 16.w,right: 16.w,top: 16.h),
      child: Container(
        // height: 162.h,
        width: 343.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColorLight.customGray.withOpacity(0.4))
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                      height: type== 'Completed'?90.h:75.h,
                      width: 105.w,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            programResponse!.images![0].image!,
                            fit: BoxFit.cover,
                            errorBuilder: (context,error,v){
                              return Image.asset(AppImages.holder);
                            },
                          ))),
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
                          type== 'Completed'?
                          RatingBar.builder(
                      initialRating: programResponse!.rate!.toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      ignoreGestures:true,
                      onRatingUpdate: (rating) {},
                    ):
                          const SizedBox.shrink(),

                        ],
                      )
                  ),
                ],
              ),
              verticalSpace(10),
              textButtonText!='cancel'.tr()?
                 // textButtonText!='Review'?
                 SizedBox(
                     height: 40.h,
                     width:311.w ,
                     child: CustomTextButton(text: textButtonText, onPressed: onPressed,)):
                 // const SizedBox.shrink():
              programResponse!.paymentStatus=='unpaid'?
              SizedBox(
                  height: 40.h,
                  width:MediaQuery.of(context).size.width*0.8,
                  child: CustomTextButton(text: 'try_pay'.tr(), onPressed: (){
                    BookingRequest bookingRequest =BookingRequest(
                      id: programResponse!.id,
                      notes:"note",
                      payment:  'Credit Card', total:  programResponse!.newPrice!=null?
                    double.parse(programResponse!.newPrice.toString()):double.parse(programResponse!.price.toString()),);
                    BookingCubit.get(context).bookingPrograms(bookingRequest, context,'Credit Card');
                  },)):
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
                           showCustomDialog(
                               context: context,
                               title:'finish2'.tr(),des: 'sure_finish'.tr(),bt1:  'yes'.tr(),bt2: 'no'.tr(),
                               onPressed1: (){
                                 CanceledRequest canceledRequest=CanceledRequest(id: programResponse!.bookingId, notes: 'note');
                                 BookingCubit.get(context).finishedProgram(canceledRequest,context,programResponse!.id!);
                                  Navigator.pop(context);

                               });

                         },))
                   ],
                 ),
            ],
          ),
        ),
      ));
  }
}
