import 'package:flutter/material.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';

class CustomTitleRow extends StatelessWidget {
  const CustomTitleRow({super.key, required this.title, required this.onTap});
 final String title;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(title,
          style: TextStyles.font24CustomBlack700WeightPoppins.copyWith(fontSize: 17),
          textScaleFactor: ScaleSize.textScaleFactor(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        InkWell(
          onTap:onTap,
          child: Text("See All",
            style: TextStyles.font12CustomGray400WeightLato.copyWith(
              color: const Color(0xffE74646),
              fontFamily: AppFontsFamily.fontPoppins,
              fontWeight: FontWeight.w700,
            ),
            textScaleFactor: ScaleSize.textScaleFactor(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
