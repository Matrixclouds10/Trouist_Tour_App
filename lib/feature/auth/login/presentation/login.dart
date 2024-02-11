import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/auth/login/logic/cubit/login_cubit.dart';
import 'package:tourist_tour_app/feature/auth/login/presentation/widget/login_bloc_listener.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_field.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit =context.read<LoginCubit>();
    return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0, ),
    child:
    Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 345.h,
                  width: 375.w,
                  child: Image.asset(
                    AppImages.login,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 345.h,
                  width: 375.w,
                  color: AppColorLight.black.withOpacity(0.30),),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox( height: 310.h, width: 375.w,),
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
                                Text('login'.tr(), style: TextStyles.font24CustomBlack700WeightPoppins,),
                                verticalSpace(2),
                                Text('login_continue'.tr(), style:  TextStyles.font17CustomGray400WightLato,),
                                verticalSpace(25),
                                Text('phone_number'.tr(), style: TextStyles.font14CustomBlack500w,),
                                verticalSpace(5),
                                CustomTextField(
                                  validationFunc: (value){
                                    if (value == null || value.isEmpty) {
                                      return 'login_val_em'.tr();
                                    }
                                    return null;
                                  },
                                  textInputType: TextInputType.number,
                                  contentVerticalPadding:15.h,
                                  prefixIcon: const Icon(Icons.phone,color: Color(0xff818181),),
                                  hintText: '',
                                  controller: cubit.phoneController,),
                                verticalSpace(20),
                                Text('password'.tr(), style: TextStyles.font14CustomBlack500w,),
                                verticalSpace(5),
                                StatefulBuilder(builder: (context,setState){
                                  return   CustomTextField(
                                    validationFunc: (value){
                                      if (value == null || value.isEmpty) {
                                        return 'login_val_pa'.tr();
                                      }
                                      return null;
                                    },
                                    onFieldSubmitted: (val){
                                      if(context.read<LoginCubit>().formKey.currentState!.validate()){
                                        cubit.emitLoginStates(context);
                                      }
                                    },
                                    textInputAction: TextInputAction.done,
                                    contentVerticalPadding:15.h,
                                    prefixIcon: const Icon(Icons.lock_open_outlined,color: Color(0xff818181),),
                                    hintText: '',
                                    isPassword: cubit.isVisible,
                                    suffixIcon: IconButton(onPressed: (){
                                      setState((){
                                        cubit.isVisible=!cubit.isVisible;
                                      });
                                    },icon:
                                    cubit.isVisible?
                                    const Icon(Icons.visibility_off_outlined,
                                      color: Color(0xff818181),
                                    ):
                                    const Icon(Icons.visibility_outlined,
                                      color: AppColorLight.primaryColor,
                                    ),
                                    ),
                                    controller:cubit.passwordController,);
                                }),

                                verticalSpace(10),
                                Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Text('forget_pass'.tr(),
                                    style:  TextStyles.font12CustomGray400WeightLato,
                                  ),
                                ),
                                verticalSpace(87),
                                CustomMaterialButtonWidget(text: 'sign_in'.tr(), onPressed: (){
                                  if(context.read<LoginCubit>().formKey.currentState!.validate()){
                                    cubit.emitLoginStates(context);
                                  }
                                }),
                                const LoginBlocListener(),
                                verticalSpace(60),
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
      ),
    ),);
  }
}
