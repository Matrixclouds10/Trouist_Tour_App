import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/feature/make_program/data/models/get_places_response.dart';
import 'package:tourist_tour_app/feature/make_program/logic/make_program_cubit.dart';
import 'package:tourist_tour_app/feature/make_program/presentation/widgets/custom_dropdown.dart';

class CustomTypeOfStayWidget extends StatefulWidget {
  const CustomTypeOfStayWidget({super.key, required this.getPlacesResponse});
  final GetPlacesResponse getPlacesResponse;
  @override
  State<CustomTypeOfStayWidget> createState() => _CustomTypeOfStayWidgetState();
}

class _CustomTypeOfStayWidgetState extends State<CustomTypeOfStayWidget> {
  int currentMethod3=0;
  @override
  Widget build(BuildContext context) {
    MakeProgramCubit cubit =MakeProgramCubit.get(context);

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
                  cubit.typeOfStaying='resorts'.tr();
                  cubit.typeOfStayingPlace=null;
                });
              },
            ),
            Text('resorts'.tr(),
              style: TextStyles.font17Black400WightLato.copyWith(
                  color: AppColorLight.customBlack
              ),
            ),
          ],
        ),
       currentMethod3==1?  CustomDrpDownWidget(hotelsResponseList: widget.getPlacesResponse.resorts!, title: '${widget.getPlacesResponse.resorts![0].name}',):const SizedBox.shrink(),

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
                  cubit.typeOfStaying='hotels'.tr();
                  cubit.typeOfStayingPlace=null;

                });
              },
            ),
            Text('hotels'.tr(),
              style: TextStyles.font17Black400WightLato.copyWith(
                  color: AppColorLight.customBlack
              ),
            ),
          ],
        ),
        currentMethod3==2?  CustomDrpDownWidget(hotelsResponseList: widget.getPlacesResponse.hotels!, title:  '${widget.getPlacesResponse.hotels![0].name}'):const SizedBox.shrink(),

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
                  cubit.typeOfStaying='rural_place'.tr();
                  cubit.typeOfStayingPlace=null;
                });
              },
            ),
            Text('rural_place'.tr(),
              style: TextStyles.font17Black400WightLato.copyWith(
                  color: AppColorLight.customBlack
              ),
            ),
          ],
        ),
        currentMethod3==3?  CustomDrpDownWidget(hotelsResponseList: widget.getPlacesResponse.inns!, title:  '${widget.getPlacesResponse.inns![0].name}'):const SizedBox.shrink(),

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
                  cubit.typeOfStaying='Furnished Apartments';
                  cubit.typeOfStayingPlace=null;


                });
              },
            ),
            Text('furnished_apartments'.tr(),
              style: TextStyles.font17Black400WightLato.copyWith(
                  color: AppColorLight.customBlack
              ),
            ),
          ],
        ),

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
                  cubit.typeOfStaying='Chalets';
                  cubit.typeOfStayingPlace=null;
                });
              },
            ),
            Text('chalets'.tr(),
              style: TextStyles.font17Black400WightLato.copyWith(
                  color: AppColorLight.customBlack
              ),
            ),
          ],
        ),

      ],
    );
  }
}
