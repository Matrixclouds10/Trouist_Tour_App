import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';

class CustomOfferWidget extends StatelessWidget {
  const CustomOfferWidget({super.key, required this.off});
  final String off;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xffC00614),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        height: 120.h,
        width:222.w,
        child: Padding(
          padding:  EdgeInsets.only(top: 5.h,left: 24.w,right: 24.w,bottom: 8.h),
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                verticalSpace(5),
                Text('now'.tr(),
                  // textScaleFactor: ScaleSize.textScaleFactor(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font17CustomGray400WightLato.copyWith(color: Colors.white),
                ),
                Text('${'off'.tr()} $off%',
                  // textScaleFactor: ScaleSize.textScaleFactor(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font14CustomBlack500w.copyWith(fontSize: 32.sp,color: Colors.white),
                ),
                Text('offer_home'.tr(),
                  // textScaleFactor: ScaleSize.textScaleFactor(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font17CustomGray400WightLato.copyWith(color: Colors.white),
                ),
                verticalSpace(5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
