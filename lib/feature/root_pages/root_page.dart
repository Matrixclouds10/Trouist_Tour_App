import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/booking/presentation/screens/booking_screen.dart';
import 'package:tourist_tour_app/feature/favorite/presentation/screens/favorite_screen.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/home/pressentation/screens/home.dart';
import 'package:tourist_tour_app/feature/more/presentation/screens/more_screen.dart';
import 'package:tourist_tour_app/feature/search/presentation/screen/search_screen.dart';

class RootPages extends StatelessWidget {
  final String? check;
   RootPages({super.key, this.check});
  List<Widget> screens =
  [
    const Home(),
    const FavoriteScreen(),
    const SearchScreen(),
    const BookingScreen(),
    const MoreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit =HomeCubit.get(context);
    cubit.initRoot(check: check);
    return MediaQuery(
          data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0,
          ),
          child: BlocConsumer<HomeCubit, DataState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                       body:   Stack(
                         children: [
                           screens[cubit.currentIndex!],
                           Positioned(
                               left: 0,
                               right: 0,
                               bottom: 0,
                               child: bottomNavigationBar(context))
                         ],
                       ),
                    );
            },
          ) );


  }
  Widget bottomNavigationBar(BuildContext context) {
    HomeCubit cubit =HomeCubit.get(context);

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: 80.h,
          child: Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: Container(
              height: 61.h,
              color: Colors.white,
              // color: const Color(0xff8E8E8E).withOpacity(0.15),
              child: Padding(
                padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          cubit.currentIndex==0? SizedBox(
                              height: 40.h,
                              width:40.w,
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Image.asset('assets/images/hag.png',),
                                  const Icon(Icons.home_outlined,color: Colors.white,)
                                ],)):
                          InkWell(
                            onTap: (){
                              cubit.changeCurrentIndex(0);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.home_outlined,color: AppColorLight.gray2,),
                                Text('home'.tr(),
                                  style: TextStyles.font10CustomGray500WightPoppins,
                                )
                              ],
                            ),
                          ),
                          cubit.currentIndex==1?
                          SizedBox(
                              height: 40.h,
                              width:40.w,
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Image.asset('assets/images/hag.png',),
                                  const Icon(Icons.favorite_border,color: Colors.white,)
                                ],)):
                          InkWell(
                            onTap: (){
                              cubit.changeCurrentIndex(1);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.favorite_border,color: AppColorLight.gray2,),
                                Text('favorite'.tr(),
                                  style: TextStyles.font10CustomGray500WightPoppins,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(null),
                          Text('search'.tr(),
                            style: TextStyles.font10CustomGray500WightPoppins,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          cubit.currentIndex==3? SizedBox(
                              height: 40.h,
                              width:40.w,
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Image.asset('assets/images/hag.png',),
                                  const Icon(Icons.calendar_month_outlined,color: Colors.white,)
                                ],)):
                          InkWell(
                            onTap: (){
                              cubit.changeCurrentIndex(3);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.calendar_month_outlined,color: AppColorLight.gray2,),
                                Text('bookings'.tr(),
                                  style: TextStyles.font10CustomGray500WightPoppins,
                                )
                              ],
                            ),
                          ),
                          cubit.currentIndex==4? SizedBox(
                              height: 40.h,
                              width:40.w,
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Image.asset('assets/images/hag.png',),
                                  const Icon(Icons.menu,color: Colors.white,)
                                ],)):
                          InkWell(
                            onTap: (){
                              cubit.changeCurrentIndex(4);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.menu,color: AppColorLight.gray2,),
                                Text('more'.tr(),
                                  style: TextStyles.font10CustomGray500WightPoppins,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {
              cubit.changeCurrentIndex(2);
            },
            child: Container(
                height: 50.h,
                width: 50.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child:  Icon(Icons.search,size: cubit.currentIndex==2?40:33,color: AppColorLight.primaryColor,)
            ),
          ),
        ),
      ],
    );

  }
}
