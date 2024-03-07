import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/core/shared_preference/shared_preference.dart';
import 'package:tourist_tour_app/feature/auth/log_as.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/more/logic/more_cubit.dart';
import 'package:tourist_tour_app/feature/more/presentation/screens/about_us/about_us_screen.dart';
import 'package:tourist_tour_app/feature/more/presentation/screens/history_program/hiistory_screen.dart';
import 'package:tourist_tour_app/feature/more/presentation/screens/privacy/privacy_screen.dart';
import 'package:tourist_tour_app/feature/more/presentation/screens/profile/edit_profile.dart';
import 'package:tourist_tour_app/feature/more/presentation/screens/terms/terms_screen.dart';
import 'package:tourist_tour_app/feature/more/presentation/widgets/custom_more_image.dart';
import 'package:tourist_tour_app/feature/more/presentation/widgets/custom_more_item_widget.dart';
import 'package:tourist_tour_app/feature/root_pages/root_page.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_dialog.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';

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
              builder: (BuildContext context) =>  RootPages(
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
             HomeCubit.get(context).token!=null?
              Column(
                children: [
                  verticalSpace(20),
                  const CircleAvatar(
                      radius: 71,
                      backgroundColor: Colors.black38,
                      child: CustomMoreImage()),
                  verticalSpace(5),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)
                    ),
                    color: AppColorLight.primaryColor,
                    onPressed: (){
                      if(cubit.profileResponse!=null){
                        cubit.nameController.text=cubit.profileResponse!.name!;
                        cubit.phoneController.text=cubit.profileResponse!.phone!;
                        cubit.emailController.text=cubit.profileResponse!.email!;
                        if(context.read<SignupCubit>().countryCodeModel!=null){
                          for(var a in context.read<SignupCubit>().countryCodeModel!){
                            if(a.id==cubit.profileResponse!.countryId){
                              cubit.countryController.text=a.name!;
                              context.read<SignupCubit>().countryChoose=a.name!;
                              cubit.countryControllerId = a.id!;
                            }
                          }
                        }
                        NavigatePages.pushToPage(const EditProfileScreen(), context);

                      }
                    },
                    child: Text('edit_profile'.tr(),
                      style: TextStyles.font12CustomRed500WeightLato.copyWith(
                          fontFamily: AppFontsFamily.fontPoppins,
                          fontSize: 14,
                          color: Colors.white
                      ),),
                  ),
                  verticalSpace(30),
                ],
              ):
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.logoSvg,
                      height: MediaQuery.of(context).size.height*0.2,
                    ),
                    verticalSpace(5),

                    SizedBox(height: 30.h,),
                  ],
                ),
              ),
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
                    HomeCubit.get(context).token!=null?
                    CustomMoreItemWidget(
                      iconPath: AppImages.more3,
                      function: (){
                        NavigatePages.pushToPage(const HistoryScreen(), context);
                      }, tex: 'program_history'.tr(),):const SizedBox.shrink(),
                    HomeCubit.get(context).token!=null?verticalSpace(16):const SizedBox.shrink(),
                    CustomMoreItemWidget(
                      hasArrowButton: false,
                      iconPath: AppImages.more4,
                      function: (){
                        if(context.locale==const Locale('en')){
                          context.setLocale(const Locale('ar'));
                        }else{
                          context.setLocale(const Locale('en'));
                        }
                        HomeCubit cubit =HomeCubit.get(context);
                        cubit.initHome(context: context);
                      }, tex: 'change_language'.tr(),
                      lang: true,
                    ),
                    HomeCubit.get(context).token!=null?
                    Column(
                     children: [
                       verticalSpace(16),
                       CustomMoreItemWidget(
                         hasArrowButton: false,
                         iconPath: AppImages.more5,
                         function: (){
                           showCustomDialog(
                               title:'log_out'.tr(),des: 'log_out_mes'.tr(),bt1:  'yes'.tr(),bt2: 'no'.tr(),
                               onPressed1: (){
                                 CacheHelper.removeData(key: 'token');
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
                                   cubit.deleteProfile(context);
                                 },
                                 context: context);
                           }, tex: 'delete_account'.tr()),
                     ],
                   ):const SizedBox.shrink()
                  ],),
                ),
                SizedBox(height: 100.h,),
                HomeCubit.get(context).token!=null?SizedBox.shrink():
                Column(
                  children: [
                    Text('Log_in_first'.tr(),
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: AppFontsFamily.fontCairo,
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    CustomMaterialButtonWidget(
                        height: 40.h,
                        minWidth: 220.w,
                        text: 'sign_up'.tr(), onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>const LogAs()));
                    }),
                  ],
                ),
              ],
            ),
          )),
        ),
      )
    );
  }
}
