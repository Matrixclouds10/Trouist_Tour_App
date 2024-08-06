import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_description_widget.dart';
import 'custom_dot.dart';

class CustomReligiousProgramWidget extends StatelessWidget {
  const CustomReligiousProgramWidget({super.key, required this.isHasDes, this.type, this.programResponse});
   final  bool isHasDes;
   final String? type;
  final ProgramResponse? programResponse;
  @override
  Widget build(BuildContext context) {
    return   Container(

      decoration:
      isHasDes==true?
      BoxDecoration(
          color: AppColorLight.customGray.withOpacity(0.10),
          borderRadius: const BorderRadius.all(Radius.circular(10))
      ):null,
      width: 343.w,
      child: Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(type!=null?16:3),
            type!=null?
            Row(children: [
              CustomDot(
                height: 16.w,
                width: 16.w,
                color: type=='up_coming'.tr()?const Color(0xffF59F01):type=='completed'.tr()?AppColorLight.primaryColor:type=='canceled'.tr()?const Color(0xffFF3A3A):null,
              ),
              Text(
              type!,
                textScaleFactor: ScaleSize.textScaleFactor(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              style: TextStyles.font17CustomBlack500WeightPoppins.copyWith(
                fontWeight: FontWeight.w400,
                color: type=='up_coming'.tr()?const Color(0xffF59F01):type=='completed'.tr()?AppColorLight.primaryColor:type=='canceled'.tr()?const Color(0xffFF3A3A):null,
              ),
              ),
              // type=='Canceled'?Icon(Icons.lo):const SizedBox.shrink(),

            ],):
            const SizedBox.shrink(),
            verticalSpace(5),
            Row(
              children: [
                SizedBox(
                  // width: 170.w,
                  child: Text(programResponse!.name!,
                    textScaleFactor: ScaleSize.textScaleFactor(context),
                    // maxLines: 1,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyles.font17CustomBlack700WeightPoppins,
                  ),
                ),
                // const Spacer(),
                // SizedBox(
                //   width: 80.w,
                //   child: Text('(150 Review)',
                //     textScaleFactor: ScaleSize.textScaleFactor(context),
                //     maxLines: 1,
                //     overflow: TextOverflow.ellipsis,
                //     style: TextStyles.font12CustomRed500WeightLato.copyWith(color: AppColorLight.desColor),
                //   ),
                // ),
                // horizontalSpace(2),
                // SizedBox(
                //   width: 30.w,
                //   child: Text('4.8',
                //     textScaleFactor: ScaleSize.textScaleFactor(context),
                //     maxLines: 1,
                //     overflow: TextOverflow.ellipsis,
                //     style: TextStyles.font18CustomBlack600Weight.copyWith(
                //         fontFamily: AppFontsFamily.fontCairo
                //     ),
                //   ),
                // ),
                // const Icon(Icons.star,color: AppColorLight.starColor,),
              ],
            ),
            Row(
              children: [
                Text('${programResponse!.price} ${'rs'.tr()}',
                  textScaleFactor: ScaleSize.textScaleFactor(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                  programResponse!.newPrice!=null && programResponse!.newPrice!=0 ?
                  TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColorLight.redColor,
                      color: AppColorLight.redColor): TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                       color: AppColorLight.redColor,
                  )
                ),
                horizontalSpace(5),
                programResponse!.newPrice!=null && programResponse!.newPrice!=0 ?
                Text('${programResponse!.newPrice} ${'rs'.tr()}',
                  textScaleFactor: ScaleSize.textScaleFactor(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font17CustomBlack700WeightPoppins.copyWith(
                      color: AppColorLight.desColor),
                ):const SizedBox.shrink(),
                const Spacer(),
              ],
            ),
            verticalSpace(5),
           isHasDes==true?
            CustomDescriptionWidget(text:
            '${programResponse!.description}', maxLines: 3,):const SizedBox.shrink(),
            verticalSpace(5),
            Row(
              children: [
                Row(
                  children: [
                    Image.asset(AppImages.returnCloc),
                    horizontalSpace(5),
                    SizedBox(
                      width: 100.w,
                      child: Text('${programResponse!.duration} ${'days'.tr()}',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font17Black400WightLato.copyWith(
                          color: AppColorLight.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,color: AppColorLight.gray2,),
                    horizontalSpace(5),
                    SizedBox(
                      width: 120.w,
                      child: Text('${programResponse!.region}',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font17Black400WightLato.copyWith(
                          color: AppColorLight.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(5),
            Row(
              children: [
                Row(
                  children: [
                    Image.asset(AppImages.group),
                    horizontalSpace(5),
                    Text('${programResponse!.groupType} ${'trip'.tr()}',
                      textScaleFactor: ScaleSize.textScaleFactor(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font17Black400WightLato.copyWith(
                        color: AppColorLight.black,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Image.asset(AppImages.person2),
                    horizontalSpace(5),
                    SizedBox(
                      width: 120.w,
                      child: Text('${programResponse!.groupSize} ${'persons'.tr()}',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font17Black400WightLato.copyWith(
                          color: AppColorLight.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(13),
          ],
        ),
      ),
    );
  }
}
