import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool x1 =true;
  bool x2 =true;
  @override
  Widget build(BuildContext context) {
    return  MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0, ),
        child: Scaffold(
        appBar:  PreferredSize(
        preferredSize: Size(double.infinity,62.h),
    child: const CustomAppBar(title:'Change Password', hasBackButton: true,)),
    body:Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(5),
            Text('New Password',
              style: TextStyles.font17Black400WightLato.copyWith(
                color: AppColorLight.customBlack,
              ),
            ),
            TextField(
              obscureText: x1,
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    x1=!x1;
                  });
                },
                icon: x1==true? const Icon(Icons.visibility_off_outlined):const Icon(Icons.visibility),
                )
              ),
            ),
            verticalSpace(20),
            Text('Confirm New Password',
              style: TextStyles.font17Black400WightLato.copyWith(
                color: AppColorLight.customBlack,
              ),
            ),
            TextField(
              obscureText: x2,
              decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      x2=!x2;
                    });
                  },
                    icon: x2==true? const Icon(Icons.visibility_off_outlined):const Icon(Icons.visibility),
                  )
              ),
            ),
            verticalSpace(300),
            CustomMaterialButtonWidget(
                text: 'Done',
                onPressed: (){
                  showToast('Done', ToastStates.success, context);
                },
            ),


          ],
        ),
      ),
    ),
        )
    );
  }
}
