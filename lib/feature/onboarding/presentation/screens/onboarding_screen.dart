import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/core/shared_preference/shared_preference.dart';
import 'package:tourist_tour_app/feature/auth/log_as.dart';
import 'package:tourist_tour_app/feature/onboarding/presentation/bloc/states.dart';
import 'package:tourist_tour_app/feature/onboarding/presentation/widgets/custom_page_view_body_widget.dart';
import 'package:tourist_tour_app/feature/onboarding/presentation/bloc/cubit.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<AppOnBoardingCubit, AppOnBoardingStates>(
        builder: (context, state) {
          return PopScope(
            canPop: false,
            onPopInvoked: (_) async {
              exit(0);
            },
            child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 600.h,
                        width: double.infinity,
                        child: PageView.builder(
                            controller: AppOnBoardingCubit.get(context).pageController,
                            physics: const BouncingScrollPhysics(),
                            onPageChanged: (int index){
                               AppOnBoardingCubit.get(context).page=index;
                               AppOnBoardingCubit.get(context).changeCurrentPage(index);
                            },
                            itemCount: AppOnBoardingCubit.get(context).list.length,
                            itemBuilder: (context, i) {
                              return CustomPageViewBodyWidget(onBoardingModel:AppOnBoardingCubit.get(context).list[i]);
                            }),
                      ),
                      verticalSpace(5),
                      Center(
                        child: SmoothPageIndicator(
                            controller: AppOnBoardingCubit.get(context).pageController,
                            count:AppOnBoardingCubit.get(context).list.length,
                          effect: const ExpandingDotsEffect(
                            activeDotColor: Color(0xff009688),
                            dotColor: Color(0xff929D9C),
                            expansionFactor: 2.5,
                            dotHeight: 10,
                          ),
                        ),
                      ),
                      verticalSpace(78),
                      AppOnBoardingCubit.get(context).currentPage==2?
                      CustomMaterialButtonWidget(text:'on_button'.tr(), onPressed: () {
                        CacheHelper.saveDate(key: 'onBoarding', value: true).then((value) =>
                        {
                          NavigatePages.pushReplacePage(const LogAs(), context)
                        });
                    }
                      ):
                      Padding(
                        padding:   EdgeInsets.symmetric(horizontal: 16.w),
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: FloatingActionButton(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50))
                            ),
                            onPressed: () {
                              AppOnBoardingCubit.get(context).changingPageView(context);
                            },
                            backgroundColor: const Color(0xff009688),
                            child: const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,),
                          ),
                        ),
                      ),
                      verticalSpace(50),
                    ],
                  ),
                )),
          );
        },
        listener: (context, state) {},
      );
  }
}
