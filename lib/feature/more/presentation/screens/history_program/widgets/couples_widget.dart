import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/images/app_images.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/feature/home/data/models/notification_response.dart';
import 'package:tourist_tour_app/feature/home/pressentation/widgets/custom_avatar_grow.dart';
import 'package:tourist_tour_app/feature/more/data/models/history_response.dart';

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({super.key, required this.historyResponse});
  final HistoryResponse historyResponse;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [BoxShadow(color: Colors.black38,blurRadius: 2,offset: Offset(3, 3))],
            border: Border.all(color: AppColorLight.customGray)
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 5.w),
          child: Column(
            children: [
              Row(
                children: [
                  horizontalSpace(5),
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.grey.shade300,
                    child: Image.asset(AppImages.logo2)
                  ),
                  horizontalSpace(15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(historyResponse.arivalMethod!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font12CustomGray400WeightLato.copyWith(
                            fontFamily: AppFontsFamily.fontPoppins,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                            fontSize: 16.sp
                        ),
                      ),
                      Text(historyResponse.placeResidence!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font12CustomGray400WeightLato.copyWith(
                            fontFamily: AppFontsFamily.fontPoppins,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp
                        ),
                      ),
                      historyResponse.placeName!=null?
                      Text(historyResponse.placeName!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font12CustomGray400WeightLato.copyWith(
                            fontFamily: AppFontsFamily.fontPoppins,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp
                        ),
                      ):const SizedBox.shrink(),
                      historyResponse.tourProgramDetails!=null?
                      Text(historyResponse.tourProgramDetails!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font12CustomGray400WeightLato.copyWith(
                            fontFamily: AppFontsFamily.fontPoppins,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp
                        ),
                      ):const SizedBox.shrink(),
                      Text(
                        '${historyResponse.createdAt}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font12CustomGray400WeightLato.copyWith(
                          fontFamily: AppFontsFamily.fontPoppins,
                            fontWeight: FontWeight.w500,
                            color: AppColorLight.customGray.withOpacity(0.8),
                            fontSize: 10.sp
                        ),
                      ),
                    ],
                  )
                ],
              ),
              verticalSpace(10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(historyResponse.touristsType!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font17CustomBlack500WeightPoppins.copyWith(
                          color: AppColorLight.customBlack,
                          fontWeight: FontWeight.w700,
                          fontSize: 17.sp
                      ),
                    ),
                    historyResponse.touristsType!='Couple'?
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(historyResponse.familyMembers!=null?historyResponse.familyMembers!.toString():'0',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font17CustomBlack500WeightPoppins.copyWith(
                              color: AppColorLight.customGray,
                              fontWeight: FontWeight.w700,
                              fontSize: 17.sp
                          ),
                        ),
                        horizontalSpace(7),
                        Text('person',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font17CustomBlack500WeightPoppins.copyWith(
                              color: AppColorLight.customGray.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                              fontFamily: AppFontsFamily.fontLato,
                            fontSize: 15
                          ),
                        ),
                      ],
                    ):const SizedBox.shrink(),
                    historyResponse.touristsType!='Couple'?
                    historyResponse.ageRange!=null?
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(historyResponse.ageRange!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font17CustomBlack500WeightPoppins.copyWith(
                              color: AppColorLight.customGray,
                              fontWeight: FontWeight.w700,
                              fontSize: 17.sp
                          ),
                        ),
                        horizontalSpace(7),
                        Text('Age',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font17CustomBlack500WeightPoppins.copyWith(
                              color: AppColorLight.customGray.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                              fontFamily: AppFontsFamily.fontLato,
                              fontSize: 15
                          ),
                        ),
                      ],
                    ):
                    const SizedBox.shrink():const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
