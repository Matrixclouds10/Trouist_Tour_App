import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/auth/presentation/screens/login.dart';
import 'package:tourist_tour_app/feature/auth/presentation/screens/register.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';

class LogAs extends StatelessWidget {
  const LogAs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            verticalSpace(34),
            Text('Enjoy Your Trip With Us',
              style: TextStyles.font24CustomBlack700Weight,
              textAlign: TextAlign.center,
            ),
            verticalSpace(8),
            Text('It is a long established fact that a reader will',
              style: TextStyles.font17CustomGray400Wight,
              textAlign: TextAlign.center,
            ),
            verticalSpace(33),
            CustomMaterialButtonWidget(text: 'Signin',
              onPressed: () {
              NavigatePages.pushToPage(const LoginScreen(), context);
            },),
            verticalSpace(16),
            CustomMaterialButtonWidget(
              backgroundColor: Colors.white,
              textColor: const Color(0xff009688),
              borderColor: const Color(0xff009688),
              text: 'Signup',
              onPressed: () {
                NavigatePages.pushToPage(const RegisterScreen(), context);
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
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400),
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
