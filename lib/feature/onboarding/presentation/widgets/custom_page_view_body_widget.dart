import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/core/shared_preference/shared_preference.dart';
import 'package:tourist_tour_app/feature/auth/log_as.dart';
import '../../data/models/model.dart';

class CustomPageViewBodyWidget extends StatelessWidget {
  const CustomPageViewBodyWidget({super.key, required this.onBoardingModel,});
  final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              SizedBox(
                height:455.h,
                width: 376.w,
                child: Image.asset(
                  onBoardingModel.image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 455.h,
                width: 376.w,
                color: const Color(0xff000000).withOpacity(0.30),),
              Positioned(
                top: 70.h,
                right: 16.5.w,
                child: InkWell(
                  onTap: (){
                    CacheHelper.saveDate(key: 'onBoarding', value: true).then((value){
                      NavigatePages.pushToPage(const LogAs(), context);
                    });
                  },
                  child: SizedBox(
                    child:  Text("Skip",
                      style:TextStyles.font14CustomWight700wLato,
                      textScaleFactor: ScaleSize.textScaleFactor(context),
                    ),
                  ),
                ),)
            ],
          ),
          verticalSpace(20),
          Text(
                onBoardingModel.title,
                textAlign: TextAlign.center,
                style: TextStyles.font24CustomBlack700WeightPoppins,
               maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textScaleFactor: ScaleSize.textScaleFactor(context),
          ),
          verticalSpace(8),
          Padding(
            padding:  EdgeInsets.only(left:16.w,right: 16.w),
            child: SizedBox(
              child: Text(
                  onBoardingModel.description,
                  // getLang(context ,'onBoardingDescription${onBoardingModel.number}'),
                  style:  TextStyles.font17CustomGray400WightLato,
                  textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: ScaleSize.textScaleFactor(context),
              ),
            ),
          ),
          const Spacer(),

        ]);
  }
}
