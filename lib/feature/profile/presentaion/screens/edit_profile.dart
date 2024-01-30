import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/profile/presentaion/screens/change_password_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_text_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  MediaQuery(
        data: MediaQuery.of(context).copyWith(
      textScaleFactor: 1.0, ),
      child: Scaffold(
        appBar:  PreferredSize(
            preferredSize: Size(double.infinity,62.h),
            child: const CustomAppBar(title:'Edit Profile', hasBackButton: true,)),
        body: Padding(
          padding:  EdgeInsets.only(left: 16.w,right: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20),
                Center(
                  child:
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      const CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                            radius:60,
                            backgroundImage:
                            AssetImage(AppImages.test2,),
                        ),),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              boxShadow: const [BoxShadow(color: Colors.black26,blurRadius: 2)]
                            ),
                            child: IconButton(
                              onPressed: () {
                              },
                              icon: const Icon(Icons.edit,color:AppColorLight.customGray,size: 19,),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(24),
                Text('Full Name',
                style: TextStyles.font17Black400WightLato.copyWith(
                  color: AppColorLight.customBlack,
                ),),
                const TextField(),
                verticalSpace(16),
                Text('Phone Number',
                  style: TextStyles.font17Black400WightLato.copyWith(
                    color: AppColorLight.customBlack,
                  ),
                ),
                const TextField(),
                verticalSpace(16),

                Text('Email Address',
                  style: TextStyles.font17Black400WightLato.copyWith(
                    color: AppColorLight.customBlack,
                  ),
                ),
                const TextField(),
                verticalSpace(16),

                Text('Country',
                  style: TextStyles.font17Black400WightLato.copyWith(
                    color: AppColorLight.customBlack,
                  ),
                ),
                const TextField(),
                verticalSpace(16),

                Text('Password',
                  style: TextStyles.font17Black400WightLato.copyWith(
                    color: AppColorLight.customBlack,),),
                  const TextField(
                    obscureText: true,
                  ),
                verticalSpace(100),
                CustomMaterialButtonWidget(text: 'Save', onPressed: (){
                  showToast('Success Save', ToastStates.success, context);
                }),
                verticalSpace(16),

                CustomTextButton(text: 'Change Password', onPressed: (){
                  NavigatePages.pushToPage(const ChangePasswordScreen(), context);
                },
                height: 56.h,
                  width: 343.w,
                ),
                verticalSpace(16),
                Center(
                  child: InkWell(
                    onTap: (){
                      showToast('Cancel Done', ToastStates.success, context);

                    },
                    child: Text('Cancel',
                    style: TextStyles.font17Black400WightLato.copyWith(
                      fontFamily: AppFontsFamily.fontPoppins,
                      color: AppColorLight.primaryColor
                    ),
                    ),
                  ),
                ),

                verticalSpace(50),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
