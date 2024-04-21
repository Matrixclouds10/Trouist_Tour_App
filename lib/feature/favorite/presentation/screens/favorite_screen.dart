import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/feature/favorite/presentation/widgets/custom_places_body.dart';
import 'package:tourist_tour_app/feature/favorite/presentation/widgets/custom_programs_body_widget.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/root_pages/root_page.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/visitor/visitor_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0, ),
        child:
        PopScope(
          canPop: false,
          onPopInvoked: (_) async {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) =>  const RootPages(
                  check: '0',
                )));
          },
          child:
          HomeCubit.get(context).token!=null?
          SafeArea(
            minimum: const EdgeInsets.only(top: 30),
            child:
            DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar:
                    AppBar(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      centerTitle: true,
                      title: Text('favourites'.tr(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font17CustomBlack500WeightPoppins,
                      ),
                      bottom:  TabBar(
                          tabs:  [
                            Tab(text: 'places'.tr()),
                            Tab(text: 'programs'.tr()),
                          ],
                        labelStyle: TextStyle(
                            color: AppColorLight.primaryColor,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFontsFamily.fontLato),
                        unselectedLabelStyle: TextStyle(
                            fontSize: 17.sp,
                            color: AppColorLight.customBlack,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFontsFamily.fontLato),
                        indicatorColor:AppColorLight.primaryColor,
                        labelColor: AppColorLight.primaryColor,
                        // indicatorPadding: EdgeInsets.symmetric(horizontal: 0.w,vertical: ),
                        unselectedLabelColor: Colors.black,
                        ),
                    ),
                  body:const TabBarView(

                    children: [
                      CustomPlacesBodyWidget(),
                      CustomProgramsBodyWidget()
                    ],
                  ),



              ),
            ),
          ):
          const CustomVisitorScreen(),
        )
    );
  }
}
