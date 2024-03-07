import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/make_program/logic/make_program_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    MakeProgramCubit cubit =MakeProgramCubit.get(context);
    return  MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1.0, ),
      child: Scaffold(
        appBar:  PreferredSize(
            preferredSize: Size(double.infinity,62.h),
            child:  CustomAppBar(title:'your_program'.tr(), hasBackButton: true,)),
        body: BlocConsumer<MakeProgramCubit, MakeProgramState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Padding(
                    padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // verticalSpace(10),
                          // Center(
                          //   child: SizedBox(
                          //       height: 190.h,
                          //       width: MediaQuery.of(context).size.width*0.9,
                          //       child: ClipRRect(
                          //         borderRadius: BorderRadius.circular(10),
                          //         child: Image.asset(AppImages.test2,
                          //         fit: BoxFit.cover,
                          //         ),
                          //       )),
                          // ),
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
                                    groupValue: cubit.currentMethod,
                                    onChanged: (value) {
                                      setState(() {
                                        cubit.currentMethod = value!;
                                        cubit.typeOfGroup='Family';
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
                                    groupValue: cubit.currentMethod,
                                    onChanged: (value) {
                                      setState(() {
                                        cubit.currentMethod = value!;
                                        cubit.typeOfGroup='Friends';

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
                                    groupValue: cubit.currentMethod,
                                    onChanged: (value) {
                                      setState(() {
                                        cubit.currentMethod = value!;
                                        cubit.typeOfGroup='Couple';

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
                          cubit.currentMethod==1?
                           const CustomDetailsOfCounterWidget(isFriends: false,)
                              :const SizedBox.shrink(),
                          cubit.currentMethod==2?
                          const CustomDetailsOfCounterWidget(isFriends: true,):
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
                                    groupValue: cubit.currentMethod2,
                                    onChanged: (value) {
                                      setState(() {
                                        cubit.currentMethod2 = value!;
                                        cubit.typeOfArrivalMethod = 'Booking Flight';
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
                                    groupValue: cubit.currentMethod2,
                                    onChanged: (value) {
                                      setState(() {
                                        cubit.currentMethod2 = value!;
                                        cubit.typeOfArrivalMethod = 'Reception At The Airport';

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
                                    groupValue: cubit.currentMethod2,
                                    onChanged: (value) {
                                      setState(() {
                                        cubit.currentMethod2 = value!;
                                        cubit.typeOfArrivalMethod = 'Coming By Private Car';

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
                          cubit.getPlacesResponse!=null?
                           CustomTypeOfStayWidget(getPlacesResponse: cubit.getPlacesResponse!,):const SizedBox.shrink(),
                          verticalSpace(85),
                          CustomMaterialButtonWidget(text: 'confirm'.tr(), onPressed: (){
                            MakeProgramCubit.get(context).makeProgram(context);
                          }),
                          verticalSpace(50),
                        ],
                      ),
                    ),
                  );
            },
          ),

      ),
    );
  }
}
