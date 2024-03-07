import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/feature/make_program/data/models/get_places_response.dart';
import 'package:tourist_tour_app/feature/make_program/logic/make_program_cubit.dart';

class CustomDrpDownWidget extends StatefulWidget {
   CustomDrpDownWidget({super.key, required this.hotelsResponseList, required this.title});
   List<HotelsResponse> hotelsResponseList;
   String title;
  @override
  State<CustomDrpDownWidget> createState() => _CustomDrpDownState();
}

class _CustomDrpDownState extends State<CustomDrpDownWidget> {

@override
  Widget build(BuildContext context) {
  MakeProgramCubit cubit =MakeProgramCubit.get(context);

  return DropdownButton2<String>(
      isExpanded: true,
      underline: const SizedBox.shrink(),
      hint: Text(widget.title, style: TextStyles.font17Black400WightLato,),
      items: widget.hotelsResponseList.map((HotelsResponse e) =>
          DropdownMenuItem<String>(
            value: e.name,
            child: Text(
              e.name!,
              style: const TextStyle(fontSize: 14),
            ),
          )).toList(),
      onChanged: (String? value) {
        setState(() {
          widget.title = value!;
          cubit.typeOfStayingPlace=value;
        });
      },
      buttonStyleData: ButtonStyleData(
          padding:const EdgeInsets.only(right: 15),
          height: 56.h,
          decoration: BoxDecoration(
              border: Border.all(color: AppColorLight.customGray.withOpacity(0.50)),
              borderRadius: BorderRadius.circular(10))),
    );

  }
}
