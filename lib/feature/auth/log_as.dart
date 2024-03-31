import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/extensions.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/routing/routes.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';

class LogAs extends StatefulWidget {
  const LogAs({super.key});

  @override
  State<LogAs> createState() => _LogAsState();
}

class _LogAsState extends State<LogAs> {
  @override
  void initState() {
    getPermission();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) async {
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (BuildContext context) => const RootPages(
        //       check: '0',
        //     )));
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 378.h,
                    width: 375.w,
                    child: Image.asset(
                      AppImages.loginAs,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 378.h,
                    width: 375.w,
                    color: AppColorLight.black.withOpacity(0.30),),
                ],
              ),
              verticalSpace(30),
              Text('log1'.tr(),
                style: TextStyles.font24CustomBlack700WeightPoppins,
                textAlign: TextAlign.center,
                textScaleFactor: ScaleSize.textScaleFactor(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,

              ),
              verticalSpace(8),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                child: Text('log2'.tr(),
                  style: TextStyles.font17CustomGray400WightLato.copyWith(
                    fontSize: 14.sp
                  ),
                  textAlign: TextAlign.center,
                  textScaleFactor: ScaleSize.textScaleFactor(context),
                ),
              ),
              verticalSpace(33),
              CustomMaterialButtonWidget(text: 'sign_in'.tr(),
                onPressed: () {
                  context.pushNamed(Routes.loginScreen);
              },),
              verticalSpace(16),
              CustomMaterialButtonWidget(
                backgroundColor: Colors.white,
                textColor: const Color(0xff009688),
                borderColor: const Color(0xff009688),
                text: 'sign_up'.tr(),
                onPressed: () {
                  context.pushNamed(Routes.signUpScreen);
                },),
              verticalSpace(16),
              InkWell(
                onTap: (){
                  context.pushReplacementNamed(Routes.rootScreen);
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 2, // Space between underline and text
                  ),
                  decoration:  BoxDecoration(
                      border: Border(bottom: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1.2, // Underline thickness
                      ))
                  ),
                  child: Text(
                    'log3'.tr(),
                    style:TextStyles.font17CustomGray400WightLato.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontFamily: AppFontsFamily.fontPoppins
                    ),
                    textScaleFactor: ScaleSize.textScaleFactor(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              verticalSpace(100),
            ],
          ),
        ),
      ),
    );
  }

  Future getPermission()async{
    bool service;
    LocationPermission permission;
    service =await Geolocator.isLocationServiceEnabled();
    if(service ==false){
    }
    permission =await Geolocator.checkPermission();
    if(permission ==LocationPermission.denied){
      permission =await Geolocator.requestPermission();
    }
    // Position p ;
    // p=await Geolocator.getCurrentPosition().then((value) => value);
    // List<Placemark> place= await placemarkFromCoordinates(p.latitude,p.longitude);
    return permission;
  }
}
