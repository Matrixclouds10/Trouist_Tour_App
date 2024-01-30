import 'package:flutter/material.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';

class CustomBottomSheetBodyWidget extends StatefulWidget {

  const CustomBottomSheetBodyWidget({super.key});

  @override
  State<CustomBottomSheetBodyWidget> createState() => _CustomBottomSheetBodyWidgetState();
}

class _CustomBottomSheetBodyWidgetState extends State<CustomBottomSheetBodyWidget> {
  int currentMethod =0;
 @override
  build(BuildContext context) {
    return
     Column(
       children: [
         Row(
           children: [
             Radio(
               activeColor:AppColorLight.primaryColor,
               value: 0,
               groupValue: currentMethod,
               onChanged: (value) {
                 // cubit.changeRadio(value!);
                 setState(() {
                   currentMethod = value!;
                 });
               },
             ),
             Text('My Plan Changed .',
               textScaleFactor: ScaleSize.textScaleFactor(context),
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               style: TextStyles.font12CustomGray400WeightLato.copyWith(
                   color: AppColorLight.customBlack
               ),
             ),
           ],
         ),
         Row(
           children: [
             Radio(
               activeColor:AppColorLight.primaryColor,
               value: 1,
               groupValue: currentMethod,
               onChanged: (value) {
                 // cubit.changeRadio(value!);
                 setState(() {
                   currentMethod = value!;
                 });
               },
             ),
             Text('My Plan Changed .',
               textScaleFactor: ScaleSize.textScaleFactor(context),
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               style: TextStyles.font12CustomGray400WeightLato.copyWith(
                   color: AppColorLight.customBlack
               ),
             ),
           ],
         ),
         Row(
           children: [
             Radio(
               activeColor:AppColorLight.primaryColor,
               value: 2,
               groupValue: currentMethod,
               onChanged: (value) {
                 // cubit.changeRadio(value!);
                 setState(() {
                   currentMethod = value!;
                 });
               },
             ),
             Text('My Plan Changed .',
               textScaleFactor: ScaleSize.textScaleFactor(context),
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               style: TextStyles.font12CustomGray400WeightLato.copyWith(
                   color: AppColorLight.customBlack
               ),
             ),
           ],
         ),
         Row(
           children: [
             Radio(
               activeColor:AppColorLight.primaryColor,
               value: 3,
               groupValue: currentMethod,
               onChanged: (value) {
                 // cubit.changeRadio(value!);
                 setState(() {
                   currentMethod = value!;
                 });
               },
             ),
             Text('Other',
               textScaleFactor: ScaleSize.textScaleFactor(context),
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               style: TextStyles.font12CustomGray400WeightLato.copyWith(
                   color: AppColorLight.customBlack
               ),
             ),
           ],
         ),
       ],
     );
  }}
