import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/root_pages/root_page.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_field.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_title_24_w400.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController =TextEditingController();
  bool isChecked = false;
  TextEditingController passController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      SizedBox( height: 280.h, width: 375.w,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30.r),topLeft: Radius.circular(30.r)),
                          color: Colors.white,
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpace(10),
                              Text('Signup!',
                              style: TextStyles.font24CustomBlack700Weight,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpace(2),
                              Text('Create A New Account',
                                style:  TextStyles.font17CustomGray400Wight,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpace(25),
                              Text('Full Name',
                                style: TextStyles.font14CustomBlack500w,
                                textAlign: TextAlign.start,
                              ),
                              verticalSpace(5),
                              CustomTextField(
                                contentVerticalPadding:16.h,
                                prefixIcon: const Icon(Icons.person,color: Color(0xff818181),),
                                hintText: '',
                                controller: emailController,),
                              verticalSpace(20),
                              Text('Phone Number',
                                style: TextStyles.font14CustomBlack500w,
                                textAlign: TextAlign.start,
                              ),
                              verticalSpace(5),
                              CustomTextField(
                                contentVerticalPadding:16.h,
                                prefixIcon: const Icon(Icons.phone,color: Color(0xff818181),),
                                hintText: '',
                                controller: emailController,),
                              verticalSpace(20),

                              Text('Email Address',
                                style: TextStyles.font14CustomBlack500w,
                                textAlign: TextAlign.start,
                              ),
                              verticalSpace(5),
                              CustomTextField(
                                contentVerticalPadding:16.h,
                                prefixIcon: const Icon(Icons.email_outlined,color: Color(0xff818181),),
                                hintText: '',
                                controller: emailController,),
                              verticalSpace(20),
                              Text('Country',
                                style: TextStyles.font14CustomBlack500w,
                                textAlign: TextAlign.start,
                              ),

                              verticalSpace(5),
                              CustomTextField(
                                contentVerticalPadding:16.h,
                                prefixIcon: const Icon(Icons.flag,color: Color(0xff818181),),
                                hintText: '',
                                controller: emailController,),
                              verticalSpace(20),
                              Text('Password',
                                style: TextStyles.font14CustomBlack500w,
                                textAlign: TextAlign.start,
                              ),

                              verticalSpace(5),
                              CustomTextField(
                                contentVerticalPadding:16.h,
                                prefixIcon: const Icon(Icons.lock_open_outlined,color: Color(0xff818181),),
                                hintText: '',
                                suffixIcon: IconButton(onPressed: (){},icon: Icon(Icons.visibility_off_outlined,color: Color(0xff818181),),),
                                controller: emailController,),
                              verticalSpace(20),
                              Text('Confirm Password',
                                style: TextStyles.font14CustomBlack500w,
                                textAlign: TextAlign.start,
                              ),
                              verticalSpace(5),
                              CustomTextField(
                                contentVerticalPadding:16.h,
                                prefixIcon: const Icon(Icons.lock_open_outlined,color: Color(0xff818181),),
                                hintText: '',
                                suffixIcon: IconButton(onPressed: (){},icon: Icon(Icons.visibility_off_outlined,color: Color(0xff818181),),),
                                controller: emailController,),
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
                                        value: isChecked,
                                         activeColor:const Color(0xff009688),
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked =value!;
                                           print(isChecked);
                                          });
                                        },
                                      ),
                                    ),
                                    horizontalSpace(10),
                                    Text('I agree the terms & Conditions ',
                                      style:  TextStyles.font12CustomGray400WeightLato,
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ),
                              verticalSpace(87),
                              CustomMaterialButtonWidget(text: 'Signin', onPressed: (){
                                 NavigatePages.pushToPage(const RootPages(), context);
                              }),
                              verticalSpace(75),
                            ],
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
    );
  }
}
