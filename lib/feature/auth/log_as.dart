import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/extensions.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/routing/routes.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/auth/login/presentation/login.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/presentation/register.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';

class LogAs extends StatelessWidget {
  const LogAs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text('Enjoy Your Trip With Us',
              style: TextStyles.font24CustomBlack700WeightPoppins,
              textAlign: TextAlign.center,
              textScaleFactor: ScaleSize.textScaleFactor(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,

            ),
            verticalSpace(8),
            Text('It is a long established fact that a reader will',
              style: TextStyles.font17CustomGray400WightLato,
              textAlign: TextAlign.center,
              textScaleFactor: ScaleSize.textScaleFactor(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(33),
            CustomMaterialButtonWidget(text: 'Signin',
              onPressed: () {
                context.pushNamed(Routes.loginScreen);
            },),
            verticalSpace(16),
            CustomMaterialButtonWidget(
              backgroundColor: Colors.white,
              textColor: const Color(0xff009688),
              borderColor: const Color(0xff009688),
              text: 'Signup',
              onPressed: () {
                context.pushNamed(Routes.signUpScreen);
              },),
            verticalSpace(16),
            Container(
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
                'Login As A Guest',
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
            verticalSpace(100),
          ],
        ),
      ),
    );
  }
}
