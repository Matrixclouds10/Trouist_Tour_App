import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/app_regex.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/presentation/widget/sign_up_bloc_listener.dart';
import 'package:tourist_tour_app/feature/root_pages/root_page.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_field.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit =context.read<SignupCubit>();
    return
      MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0,),
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
                  child: Column(
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
                                Text('Signup!',
                                style: TextStyles.font24CustomBlack700WeightPoppins,
                                ),
                                verticalSpace(2),
                                Text('Create A New Account',
                                  style:  TextStyles.font17CustomGray400WightLato,
                                ),
                                verticalSpace(25),
                                Text('Full Name',
                                  style: TextStyles.font14CustomBlack500w,
                                ),
                                verticalSpace(5),
                                CustomTextField(
                                  validationFunc: (value){
                                    if (value == null ||
                                        value.isEmpty ) {
                                      return 'Please enter a valid full name';
                                    }
                                    return null;
                                  },
                                  contentVerticalPadding:15.h,
                                  prefixIcon: const Icon(Icons.person,color: Color(0xff818181),),
                                  hintText: '',
                                  controller: cubit.nameController,),
                                verticalSpace(20),
                                Text('Phone Number',
                                  style: TextStyles.font14CustomBlack500w,
                                ),
                                verticalSpace(5),
                                CustomTextField(
                                  validationFunc: (value){
                                    if (value == null ||
                                        value.isEmpty ||
                                        !AppRegex.isPhoneNumberValid(value)) {
                                      return 'Please enter a valid phone';
                                    }
                                    return null;
                                  },
                                  contentVerticalPadding:15.h,
                                  prefixIcon: const Icon(Icons.phone,color: Color(0xff818181),),
                                  hintText: '',
                                  controller: cubit.phoneController,),
                                verticalSpace(20),

                                Text('Email Address',
                                  style: TextStyles.font14CustomBlack500w,
                                ),
                                verticalSpace(5),
                                CustomTextField(
                                  validationFunc: (value){
                                    if (value == null ||
                                        value.isEmpty ||
                                        !AppRegex.isEmailValid(value)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                  contentVerticalPadding:15.h,
                                  prefixIcon: const Icon(Icons.email_outlined,color: Color(0xff818181),),
                                  hintText: '',
                                  controller: cubit.emailController,),
                                verticalSpace(20),
                                Text('Country',
                                  style: TextStyles.font14CustomBlack500w,
                                ),
                                verticalSpace(5),
                                CustomTextField(
                                  validationFunc: (value){
                                    if (value == null ||
                                        value.isEmpty ) {
                                      return 'Please enter a valid country';
                                    }
                                    return null;
                                  },
                                  contentVerticalPadding:16.h,
                                  prefixIcon: const Icon(Icons.flag,color: Color(0xff818181),),
                                  hintText: '',
                                  controller: cubit.countryController,),
                                verticalSpace(20),
                                Text('Password',
                                  style: TextStyles.font14CustomBlack500w,
                                ),

                                verticalSpace(5),
                                CustomTextField(
                                  validationFunc: (value){
                                    if (value == null ||
                                        value.isEmpty ) {
                                      if(value!.length<=6 ){
                                        return 'Please enter a valid password';
                                      }
                                    }
                                    return null;
                                  },
                                  contentVerticalPadding:15.h,
                                  prefixIcon: const Icon(Icons.lock_open_outlined,color: Color(0xff818181),),
                                  hintText: '',
                                  suffixIcon: IconButton(onPressed: (){},icon: const Icon(Icons.visibility_off_outlined,color: Color(0xff818181),),),
                                  controller: cubit.passwordController,),
                                verticalSpace(20),
                                Text('Confirm Password',
                                  style: TextStyles.font14CustomBlack500w,
                                ),
                                verticalSpace(5),
                                CustomTextField(
                                  validationFunc: (value){
                                    if (value == null ||
                                        value.isEmpty ) {
                                      if(value!.length<=6 ){
                                        return 'Please enter a valid confirm password';
                                      }
                                    }
                                    return null;
                                  },
                                  contentVerticalPadding:15.h,
                                  prefixIcon: const Icon(Icons.lock_open_outlined,color: Color(0xff818181),),
                                  hintText: '',
                                  suffixIcon: IconButton(onPressed: (){},icon: const Icon(Icons.visibility_off_outlined,color: Color(0xff818181),),),
                                  controller: cubit.passwordConfirmationController,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0,left: 4),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: Checkbox(
                                          side:const BorderSide(color:  Color(0xff929D9C)),
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          value: cubit.isChecked,
                                           activeColor:const Color(0xff009688),
                                          onChanged: (bool? value) {
                                            cubit.isChecked =value!;
                                          },
                                        ),
                                      ),
                                      horizontalSpace(10),
                                      Text('I agree the terms & Conditions ',
                                        style:  TextStyles.font12CustomGray400WeightLato,
                                        textAlign: TextAlign.end,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                verticalSpace(87),
                                CustomMaterialButtonWidget(text: 'Signup', onPressed: (){
                                  if(context.read<SignupCubit>().formKey.currentState!.validate()){
                                    cubit.emitSignupStates();
                                  }
                                }),
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
