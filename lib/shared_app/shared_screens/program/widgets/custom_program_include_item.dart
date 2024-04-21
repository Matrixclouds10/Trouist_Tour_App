import 'package:flutter/material.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';

class CustomProgramIncludeItem extends StatelessWidget {
  const CustomProgramIncludeItem({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Icon(Icons.check,color: AppColorLight.customGreen,),
        horizontalSpace(13),
        Expanded(
          child: Text('$text',
            textScaleFactor: ScaleSize.textScaleFactor(context),
            style: TextStyles.font17Black400WightLato.copyWith(color: AppColorLight.customBlack),
          ),
        ),
      ],
    );
  }
}
