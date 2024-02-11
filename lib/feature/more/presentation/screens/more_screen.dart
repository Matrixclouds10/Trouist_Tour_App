import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/core/shared_preference/shared_preference.dart';
import 'package:tourist_tour_app/feature/auth/log_as.dart';
import 'package:tourist_tour_app/feature/more/logic/more_cubit.dart';
import 'package:tourist_tour_app/feature/more/presentation/screens/about_us/about_us_screen.dart';
import 'package:tourist_tour_app/feature/more/presentation/screens/history_program/hiistory_screen.dart';
import 'package:tourist_tour_app/feature/more/presentation/screens/privacy/privacy_screen.dart';
import 'package:tourist_tour_app/feature/more/presentation/screens/profile/edit_profile.dart';
import 'package:tourist_tour_app/feature/more/presentation/screens/terms/terms_screen.dart';
import 'package:tourist_tour_app/feature/more/presentation/widgets/custom_more_item_widget.dart';
import 'package:tourist_tour_app/feature/root_pages/root_page.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_dialog.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MoreCubit cubit=MoreCubit.get(context);
    return
      MediaQuery(
        data: MediaQuery.of(context).copyWith(
      textScaleFactor: 1.0, ),
    child:
      PopScope(
        canPop: false,
        onPopInvoked: (_) async {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => const RootPages(
                check: '0',
              )));
        },
        child: SafeArea(
          minimum:EdgeInsets.only(top: 35.h),
          child: Scaffold(
          appBar:   PreferredSize(
              preferredSize: Size(double.infinity,62.h),
              child:  CustomAppBar(title:'more'.tr(), hasBackButton: false,)),
          body: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(20),
                const CircleAvatar(
                  radius: 71,
                  backgroundColor: Colors.black38,
                  child: CircleAvatar(
                    radius:70,
                    backgroundImage:
                    NetworkImage('https://ui-avatars.com/api/?font-size=0.5&name=ya&bold=true&width=1024&size=1024'),
                  ),),
                verticalSpace(5),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)
                  ),
                  color: AppColorLight.primaryColor,
                  onPressed: (){
                    NavigatePages.pushToPage(const EditProfileScreen(), context);
                  },
                child: Text('edit_profile'.tr(),
                style: TextStyles.font12CustomRed500WeightLato.copyWith(
                  fontFamily: AppFontsFamily.fontPoppins,
                  fontSize: 14,
                  color: Colors.white
                  ),),
                ),
                verticalSpace(30),
                Padding(
                  padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                  child: Column(children: [
                    CustomMoreItemWidget(
                      iconPath: AppImages.more1,
                      function: (){
                        cubit.getAboutUs(context.locale.toString(),context);
                        NavigatePages.pushToPage(const AboutUsScreen(), context);
                      }, tex: 'about_us'.tr(),),
                    verticalSpace(16),
                    CustomMoreItemWidget(
                      iconPath: AppImages.more2,
                      function: (){
                        cubit.getPrivacy(context.locale.toString(),context);
                        NavigatePages.pushToPage(const PrivacyScreen(), context);
                      }, tex: 'privacy'.tr(),),
                    verticalSpace(16),
                    CustomMoreItemWidget(
                      iconPath: AppImages.more2,
                      function: (){
                        cubit.getTermsApp(context.locale.toString(),context);
                        NavigatePages.pushToPage(const TermsScreen(), context);
                      }, tex: 't&c'.tr(),),
                    verticalSpace(16),
                    CustomMoreItemWidget(
                      iconPath: AppImages.more3,
                      function: (){
                        NavigatePages.pushToPage(const HistoryScreen(), context);
                      }, tex: 'program_history'.tr(),),
                    verticalSpace(16),
                    CustomMoreItemWidget(
                      hasArrowButton: false,
                      iconPath: AppImages.more4,
                      function: (){
                        if(context.locale==const Locale('en')){
                          context.setLocale(const Locale('ar'));
                        }else{
                          context.setLocale(const Locale('en'));
                        }
                      }, tex: 'change_language'.tr(),
                      lang: true,
                    ),
                    verticalSpace(16),
                    CustomMoreItemWidget(
                      hasArrowButton: false,
                      iconPath: AppImages.more5,
                      function: (){
                        showCustomDialog(title:'log_out'.tr(),des: 'log_out_mes'.tr(),bt1:  'yes'.tr(),bt2: 'no'.tr(),
                            onPressed1: (){
                             CacheHelper.removeData(key: 'isLog').then((value) {
                               NavigatePages.pushReplacePage(const LogAs(), context);
                             });
                            },
                            context: context);
                      }, tex: 'logout'.tr(),),
                    verticalSpace(16),
                    CustomMoreItemWidget(
                      hasArrowButton: false,
                      iconPath: AppImages.more6,
                      textColor: Colors.red,
                      function: (){
                        showCustomDialog(title:'delete_account'.tr(),des: 'delete_account_mes'.tr(),bt1:  'yes'.tr(),bt2:  'no'.tr(),
                            onPressed1: (){
                              // CacheHelper.removeData(key: 'isLog').then((value) {
                              //   NavigatePages.pushReplacePage(const LogAs(), context);
                              // });
                            },
                            context: context);
                      }, tex: 'delete_account'.tr()),
                  ],),
                )
              ],
            ),
          )),
        ),
      )
    );
  }
}
