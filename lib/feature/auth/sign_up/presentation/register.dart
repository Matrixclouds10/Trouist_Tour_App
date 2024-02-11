import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/helpers/bloc/help_cubit.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/presentation/widget/custom_sign_up_body.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/presentation/widget/sign_up_bloc_listener.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var cubit =context.read<SignupCubit>();
    cubit.getCountryCode();
    cubit.getTerms('ar');
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0,),
    child:
      Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 317.h,
                  width: 375.w,
                  child: Image.asset(
                    AppImages.register,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 317.h,
                  width: 375.w,
                  color: AppColorLight.black.withOpacity(0.10),),
                SingleChildScrollView(
                  child:
                  Column(
                    children: [
                      SizedBox(height: 280.h, width: 375.w,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30.r),topLeft: Radius.circular(30.r)),
                          color: Colors.white,
                        ),
                        child:  Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                          child: Form(
                            key: cubit.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                verticalSpace(10),
                                Text('sign_up!'.tr(),
                                style: TextStyles.font24CustomBlack700WeightPoppins,
                                ),
                                verticalSpace(2),
                                Text('create_account'.tr(),
                                  style:  TextStyles.font17CustomGray400WightLato,
                                ),
                                verticalSpace(25),
                                const CustomSignUpBodyWidget(),
                                verticalSpace(87),
                                CustomMaterialButtonWidget(text: 'sign_up'.tr(), onPressed:
                                    (){
                                  if(context.read<SignupCubit>().formKey.currentState!.validate()){
                                    if(cubit.countryChooseId!=null){
                                      print(cubit.countryChooseId!);
                                      if(context.read<HelpCubit>().isChecked==false){
                                        context.read<HelpCubit>().changeColor(AppColorLight.redColor);
                                      }else{
                                        cubit.emitSignupStates();
                                      }
                                    }else{
                                      showToast('choose_country'.tr(), ToastStates.error, context);
                                    }
                                  }
                                }
                                ),
                                verticalSpace(75),
                                const SignupBlocListener()
                              ],
                            ),
                          ),
                        ),

                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),),
    );
  }
}
