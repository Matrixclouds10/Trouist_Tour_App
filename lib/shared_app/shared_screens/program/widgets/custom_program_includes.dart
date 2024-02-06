import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_program_include_item.dart';

class CustomProgramIncludesWidget extends StatelessWidget {
  const CustomProgramIncludesWidget({super.key, this.color, this.programResponse});
  final Color? color;
  final ProgramResponse? programResponse;

  @override
  Widget build(BuildContext context) {
    return   Container(
      height:310.h ,
      width: 343.w,
      decoration: BoxDecoration(
          color: color ??AppColorLight.customGray.withOpacity(0.10),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child:
      Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(13),
            Text('The program includes',
              textScaleFactor: ScaleSize.textScaleFactor(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.font17CustomBlack700WeightPoppins,
            ),
            verticalSpace(8),
            Expanded(
              child: ListView.builder(
                  itemCount:  programResponse!.priceIncludes!.length,
                  itemBuilder: (context,index){
                return CustomProgramIncludeItem(text: programResponse!.priceIncludes![index],);
              }),
            )
          ],
        ),
      ),
    );
  }
}
