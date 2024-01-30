import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';

class CustomDrpDownWidget extends StatefulWidget {
  const CustomDrpDownWidget({super.key});

  @override
  State<CustomDrpDownWidget> createState() => _CustomDrpDownState();
}

class _CustomDrpDownState extends State<CustomDrpDownWidget> {
  var value1='Laguna Vista';
var value2='Golden Tulip';
var value3='Al-Malfa Hotel';
List<String> list=['Laguna Vista','Golden Tulip','Al-Malfa Hotel','Al-Morshedy Hotel','El Alaamen Hotel'];
@override
  Widget build(BuildContext context) {
    return DropdownButton2<String>(

      // iconStyleData:IconStyleData(icon: Icon(Icons.arrow_drop_down_circle_outlined)),
      isExpanded: true,
      underline: const SizedBox.shrink(),
      hint: Text(value1, style: TextStyles.font17Black400WightLato,),
      items: list.map((String? e) =>
          DropdownMenuItem<String>(
            value: e!,
            child: Text(
              e,
              style: const TextStyle(fontSize: 14),
            ),
          )).toList(),
      onChanged: (String? value) {
        setState(() {
          value1 = value!;
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
