import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/booking/presentation/widgets/custom_canceled_widget.dart';
import 'package:tourist_tour_app/feature/booking/presentation/widgets/custom_completed_widget.dart';
import 'package:tourist_tour_app/feature/booking/presentation/widgets/custom_up_coming_widget.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
import 'package:tourist_tour_app/feature/root_pages/root_page.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/visitor/visitor_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // number of tabs
      child: PopScope(
        canPop: false,
        onPopInvoked: (_) async {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) =>  RootPages(
                check: '0',
              )));
        },
        child:
        HomeCubit.get(context).token!=null?
        SafeArea(
          minimum:EdgeInsets.only(top: 20.h),
          child: Scaffold(
            appBar:
            PreferredSize(
                preferredSize: Size(double.infinity,62.h),
                child:  CustomAppBar(title:'bookings'.tr(), hasBackButton: false,
                  onTap: (){
                  // Navigator.pop(context);
                    NavigatePages.pushToPage( RootPages(check:'0',), context);}
                )),
            body: Column(
              children: [
                TabBar(
                  labelStyle: TextStyles.font17Black400WightLato,
                  indicatorColor: AppColorLight.primaryColor,
                  labelColor: AppColorLight.primaryColor,
                  tabs:  [
                    Tab(text: 'up_coming'.tr()),
                    Tab(text: 'completed'.tr()),
                    Tab(text: 'canceled'.tr()),
                  ],
                ),
                 const Expanded(
                  child: TabBarView(
                    children: [
                      CustomUpComingWidget(),
                      CustomCompleteWidget(),
                      CustomCanceledWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ):const CustomVisitorScreen(),
      ),
    );
  }
}
