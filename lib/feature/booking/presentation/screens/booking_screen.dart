import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/feature/booking/presentation/widgets/custom_canceled_widget.dart';
import 'package:tourist_tour_app/feature/booking/presentation/widgets/custom_completed_widget.dart';
import 'package:tourist_tour_app/feature/booking/presentation/widgets/custom_up_coming_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_app_bar.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // number of tabs
      child: SafeArea(
        minimum:EdgeInsets.only(top: 20.h),
        child: Scaffold(
          appBar:
          PreferredSize(
              preferredSize: Size(double.infinity,62.h),
              child: const CustomAppBar(title:'Bookings', hasBackButton: true,)),
          body: Column(
            children: [
              TabBar(
                labelStyle: TextStyles.font17Black400WightLato,
                indicatorColor: AppColorLight.primaryColor,
                labelColor: AppColorLight.primaryColor,
                tabs: const [
                  Tab(text: 'Up Coming'),
                  Tab(text: 'Completed '),
                  Tab(text: 'Canceled'),
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
      ),
    );
  }
}
