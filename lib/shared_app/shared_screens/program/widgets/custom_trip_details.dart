import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_dot.dart';

class CustomTripDetailsWidget extends StatelessWidget {
  const CustomTripDetailsWidget({super.key, this.color, this.programResponse});
  final Color? color;
  final ProgramResponse? programResponse;

  @override
  Widget build(BuildContext context) {
    return           Container(
      height:programResponse!.tourRoute!.length*130.h,
      width: 343.w,
      decoration: BoxDecoration(
          color: color ?? AppColorLight.customGray.withOpacity(0.10),
          borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(13),
            Text('trip_details'.tr(),
              textScaleFactor: ScaleSize.textScaleFactor(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.font17CustomBlack700WeightPoppins,
            ),
            Expanded(child:
            ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: programResponse!.tourRoute!.length,
                itemBuilder: (context,index){
                 var mq =MediaQuery.of(context).size;
                  return Row(
                    children: [
                      SizedBox(
                      width:mq.width*0.18,
                      child: Text('${programResponse!.tourRoute![index].key}',
                                  textScaleFactor: ScaleSize.textScaleFactor(context),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.font12CustomGray400WeightLato.copyWith(color: AppColorLight.customBlack),
                                   maxLines: 3,
                                ),),
                      const CustomDot(),
                      SizedBox(width: 10.w,),
                      Expanded(
                        child: Text('${programResponse!.tourRoute![index].value}',
                                textScaleFactor: ScaleSize.textScaleFactor(context),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.font17Black400WightLato.copyWith(
                                    color: AppColorLight.customBlack
                                ),
                              ),
                      ),
                    ],
                  );
                },
              separatorBuilder: (BuildContext context, int index) {
                var mq =MediaQuery.of(context).size;
                return Row(
                    children: [
                      SizedBox(width:mq.width*0.18,),
                      SizedBox(
                        height: 70.h,
                        child: const VerticalDivider(thickness: 1,color: AppColorLight.primaryColor,),),
                      SizedBox(width: 10.w,),
                      const Expanded(child: SizedBox(),),
                    ],
                  );
              },),),



          ],
        ),
      ),
    );
  }
}
