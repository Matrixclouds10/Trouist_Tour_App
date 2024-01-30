import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/app_fonts/app_fonts.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/feature/favorite/presentation/widgets/custom_places_body.dart';
import 'package:tourist_tour_app/feature/favorite/presentation/widgets/custom_programs_body_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0, ),
        child:
        SafeArea(
          minimum: const EdgeInsets.only(top: 30),
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar:
                  AppBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    centerTitle: true,
                    title: Text('Favourites',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font17CustomBlack500WeightPoppins,
                    ),
                    bottom:  TabBar(
                        tabs: const [
                          Tab(text: 'Places'),
                          Tab(text: 'Programs'),
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
        )
    );
  }
}
