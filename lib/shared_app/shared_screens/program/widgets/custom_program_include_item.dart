import 'package:flutter/material.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';

class CustomProgramIncludeItem extends StatelessWidget {
  const CustomProgramIncludeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Icon(Icons.check,color: AppColorLight.customGreen,),
        horizontalSpace(13),
        Expanded(
          child: Text('Lorem ipsum dolor sit amet consectetur. Tristique viverra .',
            style: TextStyles.font17Black400WightLato.copyWith(
                color: AppColorLight.customBlack
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
