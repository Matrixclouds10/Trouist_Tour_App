import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/make_program/presentation/widgets/custom_details_of_counter.dart';
import 'package:tourist_tour_app/feature/make_program/presentation/widgets/custom_typr_of_stay_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';

class CustomProgramScreen extends StatefulWidget {
  const CustomProgramScreen({super.key});

  @override
  State<CustomProgramScreen> createState() => _CustomProgramScreenState();
}

class _CustomProgramScreenState extends State<CustomProgramScreen> {
  int currentMethod=0;
  int currentMethod2=0;

  @override
  Widget build(BuildContext context) {
    return  MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1.0, ),
      child: Scaffold(
        appBar:  PreferredSize(
            preferredSize: Size(double.infinity,62.h),
            child: const CustomAppBar(title:'Your Program', hasBackButton: true,)),
        body: Padding(
          padding:  EdgeInsets.only(left: 16.w,right: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(10),
                Center(
                  child: SizedBox(
                      height: 190.h,
                      width: MediaQuery.of(context).size.width*0.9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(AppImages.test2,
                        fit: BoxFit.cover,
                        ),
                      )),
                ),
                verticalSpace(16),
                Text('Type Of Group',
                style: TextStyles.font17CustomBlack700WeightPoppins,),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
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
                       Text('Family',
                         style: TextStyles.font17Black400WightLato.copyWith(
                             color: AppColorLight.customBlack
                         ),
                       ),
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
                       Text('Friends',
                         style: TextStyles.font17Black400WightLato.copyWith(
                             color: AppColorLight.customBlack
                         ),
                       ),
                     ],
                   ),
                   Row(
                     children: [
                       Radio(
                         activeColor:AppColorLight.primaryColor,
                         value: 3,
                         groupValue: currentMethod,
                         onChanged: (value) {
                           // cubit.changeRadio(value!);
                           setState(() {
                             currentMethod = value!;
                           });
                         },
                       ),
                       Text('Couple',
                         style: TextStyles.font17Black400WightLato.copyWith(
                             color: AppColorLight.customBlack
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
                verticalSpace(16),
                currentMethod==1?
                const CustomDetailsOfCounterWidget(text1: 'Number Of Persons', text2: 'Number Of Childerns ( From 2 - 12 yeas )',
                  text3: 'Number Of Babbies ( From 0 - 2 yeas )',)
                    :const SizedBox.shrink(),
                currentMethod==2?
                const CustomDetailsOfCounterWidget(text1: 'Number Of Persons',
                  text2: 'Number Of Males ', text3: 'Number Of Females ',):
                const SizedBox.shrink(),
                currentMethod==3?
                const CustomDetailsOfCounterWidget(text1: 'Number Of Persons',
                  text2: 'Number Of Males ', text3: 'Number Of Females ',):
                const SizedBox.shrink(),

                Text('Type Of Recepion & Arrival',
                  style: TextStyles.font17CustomBlack700WeightPoppins,),
                Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                          activeColor:AppColorLight.primaryColor,
                          value: 1,
                          groupValue: currentMethod2,
                          onChanged: (value) {
                            // cubit.changeRadio(value!);
                            setState(() {
                              currentMethod2 = value!;
                            });
                          },
                        ),
                        Text(' Booking Flight',
                          style: TextStyles.font17Black400WightLato.copyWith(
                              color: AppColorLight.customBlack
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor:AppColorLight.primaryColor,
                          value: 2,
                          groupValue: currentMethod2,
                          onChanged: (value) {
                            // cubit.changeRadio(value!);
                            setState(() {
                              currentMethod2 = value!;
                            });
                          },
                        ),
                        Text(' Reception At The Airport',
                          style: TextStyles.font17Black400WightLato.copyWith(
                              color: AppColorLight.customBlack
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor:AppColorLight.primaryColor,
                          value: 3,
                          groupValue: currentMethod2,
                          onChanged: (value) {
                            // cubit.changeRadio(value!);
                            setState(() {
                              currentMethod2 = value!;
                            });
                          },
                        ),
                        Text('Coming By Private Car',
                          style: TextStyles.font17Black400WightLato.copyWith(
                              color: AppColorLight.customBlack
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpace(16),

                Text('Type Of Staying',
                  style: TextStyles.font17CustomBlack700WeightPoppins,),
                const CustomTypeOfStayWidget(),
                verticalSpace(85),
                CustomMaterialButtonWidget(text: 'Confirm', onPressed: (){
                  showToast('Successfully Confirm', ToastStates.success, context);
                }),
                verticalSpace(50),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
