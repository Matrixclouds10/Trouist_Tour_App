import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/more/presentation/screens/about_us_screen.dart';
import 'package:tourist_tour_app/feature/more/presentation/screens/hiistory_screen.dart';
import 'package:tourist_tour_app/feature/more/presentation/screens/terms_screen.dart';
import 'package:tourist_tour_app/feature/more/presentation/widgets/custom_more_item_widget.dart';
import 'package:tourist_tour_app/feature/profile/presentaion/screens/edit_profile.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      MediaQuery(
        data: MediaQuery.of(context).copyWith(
      textScaleFactor: 1.0, ),
    child:
      SafeArea(
        minimum:EdgeInsets.only(top: 35.h),
        child: Scaffold(
        appBar:   PreferredSize(
            preferredSize: Size(double.infinity,62.h),
            child: const CustomAppBar(title:'More  ', hasBackButton: false,)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(20),
              const CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius:65,
                  backgroundImage:
                  AssetImage(AppImages.test2,),
                ),),
              verticalSpace(8),
              SizedBox(
                height: 30.h,
                width: 95.w,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)
                  ),
                  color: AppColorLight.primaryColor,
                  onPressed: (){
                    NavigatePages.pushToPage(const EditProfileScreen(), context);
                  },
                child: FittedBox(
                  child: Text('Edit Profile',
                  style: TextStyles.font12CustomRed500WeightLato.copyWith(
                    fontFamily: AppFontsFamily.fontPoppins,
                    color: Colors.white
                  ),
                  ),
                ),
                ),
              ),
              verticalSpace(30),
              Padding(
                padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                child: Column(children: [
                  CustomMoreItemWidget(
                    iconPath: AppImages.more1,
                    function: (){
                      NavigatePages.pushToPage(const AboutUsScreen(), context);
                    }, tex: 'About Us',),
                  verticalSpace(16),
                  CustomMoreItemWidget(
                    iconPath: AppImages.more2,
                    function: (){

                      NavigatePages.pushToPage(const TermsScreen(), context);
                    }, tex: 'Terms & Condiions',),
                  verticalSpace(16),
                  CustomMoreItemWidget(
                    iconPath: AppImages.more3,
                    function: (){
                      NavigatePages.pushToPage(const HistoryScreen(), context);

                    }, tex: 'Your Program History',),
                  verticalSpace(16),
                  CustomMoreItemWidget(
                    hasArrowButton: false,
                    iconPath: AppImages.more4,
                    function: (){}, tex: 'Change Language',
                    lang: true,
                  ),
                  verticalSpace(16),
                  CustomMoreItemWidget(
                    hasArrowButton: false,
                    iconPath: AppImages.more5,
                    function: (){}, tex: 'Logout',),
                  verticalSpace(16),
                  CustomMoreItemWidget(
                    hasArrowButton: false,
                    iconPath: AppImages.more6,
                    textColor: Colors.red,
                    function: (){}, tex: 'Delete Account',),
                ],),
              )
          
            ],
          ),
        )),
      )
    );
  }
}
