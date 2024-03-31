import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/scale_size.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/core/shared_preference/shared_preference.dart';
import 'package:tourist_tour_app/feature/auth/log_as.dart';
import 'package:tourist_tour_app/feature/onboarding/presentation/bloc/cubit.dart';
import 'package:tourist_tour_app/feature/onboarding/presentation/bloc/states.dart';
import '../../data/models/model.dart';

class CustomPageViewBodyWidget extends StatelessWidget {
  const CustomPageViewBodyWidget({super.key, required this.onBoardingModel,});

  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<AppOnBoardingCubit, AppOnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 445.h,
                      width: 376.w,
                      child: Image.asset(
                        onBoardingModel.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 445.h,
                      width: 376.w,
                      color: const Color(0xff000000).withOpacity(0.30),),
                    Positioned(
                      top: 70.h,
                      right: 16.5.w,
                      child: InkWell(
                        onTap: () {
                          CacheHelper.saveDate(key: 'onBoarding', value: true)
                              .then((value) {
                            NavigatePages.pushToPage(const LogAs(), context);
                          });
                        },
                        child: SizedBox(
                          child: Text("skip".tr(),
                            style: TextStyles.font14CustomWight700wLato,
                            textScaleFactor: ScaleSize.textScaleFactor(context),
                          ),
                        ),
                      ),),
                    Positioned(
                      top: 70.h,
                      left: 16.5.w,
                      child:
                      InkWell(
                        onTap: () {
                          if (context.locale == const Locale('en')) {
                            context.setLocale(const Locale('ar')).then((value) {
                              AppOnBoardingCubit.get(context).init();
                            });
                          }
                          else {
                            context.setLocale(const Locale('en')).then((value){
                              AppOnBoardingCubit.get(context).init();
                            });
                          }
                        },
                        child: SizedBox(
                          child: Text("on_language".tr(),
                            style: TextStyles.font14CustomWight700wLato,
                            textScaleFactor: ScaleSize.textScaleFactor(context),
                          ),
                        ),
                      ),),
                  ],
                ),
                verticalSpace(10),
                Text(
                  onBoardingModel.title,
                  textAlign: TextAlign.center,
                  style: TextStyles.font24CustomBlack700WeightPoppins,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: ScaleSize.textScaleFactor(context),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 16.w),
                    child: Center(
                      child: Text(
                        onBoardingModel.description,
                        // getLang(context ,'onBoardingDescription${onBoardingModel.number}'),
                        style: TextStyles.font17CustomGray400WightLato,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                      ),
                    ),
                  ),
                ),
              ]);
        },
      );
  }
}
