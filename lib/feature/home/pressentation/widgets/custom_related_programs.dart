import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/screens/program_details.dart';

class CustomRelatedProgramsWidget extends StatelessWidget {
  const CustomRelatedProgramsWidget({super.key, required this.programResponse});
  final ProgramResponse programResponse;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        NavigatePages.pushToPage( ProgramDetailsScreen(programResponse: programResponse,), context);
      },
      child: Padding(
        padding:  EdgeInsets.only(right: 8.w),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: 170.w,
                height: 90.h,
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.network(programResponse.images![0].image!,fit: BoxFit.cover,
                    errorBuilder: (context,error,v){
                      return Image.asset(AppImages.holder,fit: BoxFit.cover,);
                    },
                    )),
              ),
            ),
            Text(programResponse.name!,
              textScaleFactor: ScaleSize.textScaleFactor(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.font17Black400WightLato.copyWith(color: AppColorLight.customBlack),
            ),
          ],
        ),
      ),
    );
  }
}
