import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_field.dart';

class ConfirmBookingScreen extends StatefulWidget {
  const ConfirmBookingScreen({super.key});

  @override
  State<ConfirmBookingScreen> createState() => _ConfirmBookingScreenState();
}

class _ConfirmBookingScreenState extends State<ConfirmBookingScreen> {
   int currentMethod=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size(double.infinity,62.h),
          child: const CustomAppBar(title:'Confirmation', hasBackButton: true,)),
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(
                 height: 172.h,
                 width: double.infinity,
                 child: Image.asset(AppImages.test2,fit: BoxFit.cover,)),
            verticalSpace(24),
            Container(
              height:310.h ,
              width: 343.w,
              decoration: BoxDecoration(
                  color: AppColorLight.customGray.withOpacity(0.10),
                  borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child:  Padding(
                padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(13),
                    Text('Religious Program',
                      style: TextStyles.font17CustomBlack700WeightPoppins,
                    ),
                    Row(
                      children: [
                        Text('1000 RS',
                          style: TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColorLight.redColor,
                              color: AppColorLight.redColor),

                        ),
                        horizontalSpace(5),
                        Text('1000 RS',
                          style: TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                              color: AppColorLight.desColor),
                        ),
                        const Spacer(),
                      ],
                    ),
                    verticalSpace(16),
                    Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(AppImages.returnCloc),
                            horizontalSpace(5),
                            Text('3 Days',
                              style: TextStyles.font17Black400WightLato.copyWith(
                                color: AppColorLight.customBlack,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined,color: AppColorLight.gray2,),
                            horizontalSpace(5),
                            Container(
                              width: 120.w,
                              child: Text('Mecca , Medina',
                                style: TextStyles.font17Black400WightLato.copyWith(
                                  color: AppColorLight.customBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    verticalSpace(5),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month_outlined,color: AppColorLight.gray2,),
                        horizontalSpace(5),
                        Text(' From 25 Dec 23 To  28 Dec 23',
                          style: TextStyles.font17Black400WightLato.copyWith(
                            color: AppColorLight.customBlack,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    Text('Notes',
                      style: TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    verticalSpace(8),
                    Expanded(
                      child: CustomTextField(
                        borderColor: Colors.white,
                        maxLines: 4,
                        hintText: '',
                        controller: TextEditingController(),),
                    ),
                    verticalSpace(8),

                  ],
                ),
              ),
            ),
            verticalSpace(24),
            Container(
              height:230.h ,
              width: 343.w,
              decoration: BoxDecoration(
                  color: AppColorLight.customGray.withOpacity(0.10),
                  borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(13),
                    Text('Payment Methods',
                      style: TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                          fontWeight: FontWeight.w600
                      ),),
                    verticalSpace(16),
                   Row(
                     children: [
                       Radio(
                         activeColor:AppColorLight.primaryColor,
                         value: 0,
                         groupValue: currentMethod,
                         onChanged: (value) {
                           // cubit.changeRadio(value!);
                           setState(() {
                             currentMethod = value!;
                           });
                         },
                       ),
                       Image.asset(AppImages.visa),
                     ],
                   ),
                   Row(
                     children: [
                       Radio(
                         activeColor:AppColorLight.primaryColor,
                         value: 1,
                         groupValue: currentMethod,
                         onChanged: (value) {
                           // cubit.changeRadio(value!);
                           setState(() {
                             currentMethod = value!;
                           });
                         },
                       ),
                       Image.asset(AppImages.card),
                     ],
                   ),
                   Row(
                     children: [
                       Radio(
                         activeColor:AppColorLight.primaryColor,
                         value: 2,
                         groupValue: currentMethod,
                         onChanged: (value) {
                           // cubit.changeRadio(value!);
                           setState(() {
                             currentMethod = value!;
                           });
                         },
                       ),
                       Image.asset(AppImages.applePay),
                     ],
                   )
                  ],
                ),
              ),
            ),
            verticalSpace(76),
            CustomMaterialButtonWidget(
                text: 'Confirm',
                onPressed: (){}),
            verticalSpace(100),
          ],
        ),
      ),
    );
  }
}
