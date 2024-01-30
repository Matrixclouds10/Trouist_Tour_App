import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/feature/make_program/presentation/widgets/custom_dropdown.dart';

class CustomTypeOfStayWidget extends StatefulWidget {
  const CustomTypeOfStayWidget({super.key});

  @override
  State<CustomTypeOfStayWidget> createState() => _CustomTypeOfStayWidgetState();
}

class _CustomTypeOfStayWidgetState extends State<CustomTypeOfStayWidget> {
  int currentMethod3=0;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            Radio(
              activeColor:AppColorLight.primaryColor,
              value: 1,
              groupValue: currentMethod3,
              onChanged: (value) {
                // cubit.changeRadio(value!);
                setState(() {
                  currentMethod3 = value!;
                });
              },
            ),
            Text('Resorts',
              style: TextStyles.font17Black400WightLato.copyWith(
                  color: AppColorLight.customBlack
              ),
            ),
          ],
        ),
       currentMethod3==1? const CustomDrpDownWidget():const SizedBox.shrink(),

        Row(
          children: [
            Radio(
              activeColor:AppColorLight.primaryColor,
              value: 2,
              groupValue: currentMethod3,
              onChanged: (value) {
                // cubit.changeRadio(value!);
                setState(() {
                  currentMethod3 = value!;
                });
              },
            ),
            Text('Hotels',
              style: TextStyles.font17Black400WightLato.copyWith(
                  color: AppColorLight.customBlack
              ),
            ),
          ],
        ),
        currentMethod3==2? const CustomDrpDownWidget():const SizedBox.shrink(),

        Row(
          children: [
            Radio(
              activeColor:AppColorLight.primaryColor,
              value: 3,
              groupValue: currentMethod3,
              onChanged: (value) {
                // cubit.changeRadio(value!);
                setState(() {
                  currentMethod3 = value!;
                });
              },
            ),
            Text('A Rural Place',
              style: TextStyles.font17Black400WightLato.copyWith(
                  color: AppColorLight.customBlack
              ),
            ),
          ],
        ),
        currentMethod3==3? const CustomDrpDownWidget():const SizedBox.shrink(),

        Row(
          children: [
            Radio(
              activeColor:AppColorLight.primaryColor,
              value: 4,
              groupValue: currentMethod3,
              onChanged: (value) {
                // cubit.changeRadio(value!);
                setState(() {
                  currentMethod3 = value!;
                });
              },
            ),
            Text('Furnished Apartments',
              style: TextStyles.font17Black400WightLato.copyWith(
                  color: AppColorLight.customBlack
              ),
            ),
          ],
        ),
        currentMethod3==4? const CustomDrpDownWidget():const SizedBox.shrink(),

        Row(
          children: [
            Radio(
              activeColor:AppColorLight.primaryColor,
              value: 5,
              groupValue: currentMethod3,
              onChanged: (value) {
                // cubit.changeRadio(value!);
                setState(() {
                  currentMethod3 = value!;
                });
              },
            ),
            Text('Chalets',
              style: TextStyles.font17Black400WightLato.copyWith(
                  color: AppColorLight.customBlack
              ),
            ),
          ],
        ),
        currentMethod3==5? const CustomDrpDownWidget():const SizedBox.shrink(),

      ],
    );
  }
}
