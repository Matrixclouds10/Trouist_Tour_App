import 'package:easy_localization/easy_localization.dart';
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
            child:  CustomAppBar(title:'your_program'.tr(), hasBackButton: true,)),
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
                Text('type_of_group'.tr(),
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
                       Text('family'.tr(),
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
                       Text('friends'.tr(),
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
                       Text('couple'.tr(),
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
                 CustomDetailsOfCounterWidget(text1: 'number_persons'.tr(), text2: '${'number_children'.tr()} ( ${'from'.tr()} 2 - 12 ${'years'.tr()} )',
                  text3: '${'number_babies'.tr()} ( ${'from'.tr()} 0 - 2 ${'years'.tr()} )',)
                    :const SizedBox.shrink(),
                currentMethod==2?
                 CustomDetailsOfCounterWidget(text1:  'number_persons'.tr(),
                  text2: 'number_males'.tr(), text3: 'number_females'.tr(),):
                const SizedBox.shrink(),
                currentMethod==3?
                 CustomDetailsOfCounterWidget(text1: 'number_persons'.tr(),
                  text2: 'number_males'.tr(), text3: 'number_females'.tr(),):
                const SizedBox.shrink(),

                Text('type_reception_arrival'.tr(),
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
                        Text('booking_flight'.tr(),
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
                        Text('reception_airport'.tr(),
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
                        Text('coming_private_car'.tr(),
                          style: TextStyles.font17Black400WightLato.copyWith(
                              color: AppColorLight.customBlack
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpace(16),

                Text('type_staying'.tr(),
                  style: TextStyles.font17CustomBlack700WeightPoppins,),
                const CustomTypeOfStayWidget(),
                verticalSpace(85),
                CustomMaterialButtonWidget(text: 'confirm'.tr(), onPressed: (){
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
