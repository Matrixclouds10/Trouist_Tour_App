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
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController =TextEditingController();
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
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.h,),
                              Text('Login!',
                              style: TextStyles.font24CustomBlack700Weight,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpace(2),
                              Text('Login To Continue',
                                style:  TextStyles.font17CustomGray400Wight,
                                textAlign: TextAlign.center,
                              ),
                              verticalSpace(25),
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
                              Text('Password',
                                style: TextStyles.font14CustomBlack500w,
                                textAlign: TextAlign.start,
                              ),
                              verticalSpace(5),
                              CustomTextField(
                                contentVerticalPadding:16.h,
                                prefixIcon: const Icon(Icons.lock_open_outlined,color: Color(0xff818181),),
                                hintText: '',
                                suffixIcon: IconButton(onPressed: (){},icon: const Icon(Icons.visibility_off_outlined,color: Color(0xff818181),),),
                                controller: emailController,),
                              verticalSpace(10),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: Text('Forget Password ?',
                                  style:  TextStyles.font12CustomGray400Weight,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              verticalSpace(87),
                              CustomMaterialButtonWidget(text: 'Signin', onPressed: (){
                                NavigatePages.pushToPage(const RootPages(), context);
                              }),
                              verticalSpace(60),
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
