import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/make_program/logic/make_program_cubit.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_field.dart';

class CustomDetailsOfCounterWidget extends StatelessWidget {
  final bool isFriends;
    const CustomDetailsOfCounterWidget({super.key, required this.isFriends, });


  @override
  Widget build(BuildContext context) {
    MakeProgramCubit cubit =MakeProgramCubit.get(context);

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('number_persons'.tr(),
          style: TextStyles.font17Black400WightLato.copyWith(
              color: AppColorLight.customBlack
          ),),
        verticalSpace(8),
        Container(
          width: 343.w,
          height: 56.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColorLight.customGray.withOpacity(0.70))
          ),
          child: Padding(
            padding:  EdgeInsets.only(left: 16.w,right: 16.w),
            child:
           StatefulBuilder(builder: (context,setState){
             return  Row(
               children: [
                 Text(isFriends==false?cubit.familyCounter.toString():cubit.friendsCounter.toString(),
                   style: TextStyles.font18CustomBlack600Weight.copyWith(
                       fontSize: 24.sp,
                       fontFamily: AppFontsFamily.fontLato
                   ),
                 ),
                 const Spacer(),
                 Container(
                   width: 25.w,
                   height: 25.h,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(6),
                       border: Border.all(color: AppColorLight.customGray.withOpacity(0.70))
                   ),
                   child: InkWell(
                     onTap: (){
                       if(isFriends==false){
                         setState(() {
                           if(cubit.familyCounter>0){
                             cubit.familyCounter--;
                           }
                         });
                       }else{
                         setState(() {
                           if(cubit.friendsCounter>0){
                             cubit.friendsCounter--;
                           }
                         });
                       }

                     },
                     child: const Padding(
                       padding: EdgeInsets.only(left: 8.0,right: 8.0),
                       child: Center(child: Divider(color: AppColorLight.customGray,thickness: 2,)),
                     ),
                   ),
                 ),
                 horizontalSpace(10),
                 Text(isFriends==false?cubit.familyCounter.toString():cubit.friendsCounter.toString(),
                   style: TextStyles.font14CustomGray400w.copyWith(
                       fontSize: 24.sp,
                       fontFamily: AppFontsFamily.fontCairo
                   ),),
                 horizontalSpace(10),
                 Container(
                   width: 25.w,
                   height: 25.h,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(6),
                       border: Border.all(color: AppColorLight.customGray.withOpacity(0.70))
                   ),
                   child: InkWell(
                     onTap: (){
                       if(isFriends==false){
                         setState(() {
                           setState(() {
                             cubit.familyCounter++;
                           });
                         });
                       }else{
                         setState(() {
                           setState(() {
                             cubit.friendsCounter++;
                           });
                         });
                       }


                     },
                     child: const Padding(
                       padding: EdgeInsets.only(bottom: 1.0),
                       child: Center(child: Text('+',
                         style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.bold,
                           color:  AppColorLight.customGray,
                         ),
                       )),
                     ),
                   ),

                 ),
               ],
             );
           },)
          ),
        ),
        verticalSpace(16),
        Text('age_group'.tr(),
          style: TextStyles.font17Black400WightLato.copyWith(
              color: AppColorLight.customBlack
          ),),
        verticalSpace(8),
        CustomTextField(
          borderColor: AppColorLight.customGray.withOpacity(0.6),
            contentHorizontalPadding: 17.w,
            textInputType: TextInputType.number,
            hintText: '16-30', controller: isFriends==false?cubit.familyNumberController:cubit.friendsNumberController),
        verticalSpace(20),

      ],
    );
  }
}
