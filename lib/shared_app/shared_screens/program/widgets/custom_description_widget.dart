import 'package:flutter/cupertino.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';

class CustomDescriptionWidget extends StatelessWidget {
  const CustomDescriptionWidget({super.key, required this.text, required this.maxLines});
 final String text;
 final int maxLines;
  @override
  Widget build(BuildContext context) {
    return  Text(text,
      textScaleFactor: ScaleSize.textScaleFactor(context),
      style: TextStyles.font17Black400WightLato.copyWith(
          color: AppColorLight.desColor),
       maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
