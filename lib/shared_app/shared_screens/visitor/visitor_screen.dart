import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/auth/log_as.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';

class CustomVisitorScreen extends StatelessWidget {
  const CustomVisitorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.logoSvg,
            height: MediaQuery.of(context).size.height*0.2,
            ),
            verticalSpace(5),
            Text('Log_in_first'.tr(),
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: AppFontsFamily.fontCairo,
              ),
            ),
            SizedBox(height: 50.h,),
            CustomMaterialButtonWidget(
              height: 40,
                minWidth: 220,
                text: 'sign_up'.tr(), onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>const LogAs()));
            }),
          ],
        ),
      ),
    );
  }
}
