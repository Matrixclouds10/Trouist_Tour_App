import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/booking/presentation/screens/confirm_booking_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_description_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_program_includes.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_religious_program_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_top_detials_stack.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_trip_details.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';

class ProgramDetailsOverViewScreen extends StatefulWidget {
  const ProgramDetailsOverViewScreen({super.key});

  @override
  State<ProgramDetailsOverViewScreen> createState() => _ProgramDetailsOverViewScreenState();
}

class _ProgramDetailsOverViewScreenState extends State<ProgramDetailsOverViewScreen> {


  @override
  Widget build(BuildContext context) {
    return
      MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0, // تعطيل textScaleFactor على مستوى التطبيق
          ),
          child:  Scaffold(
            body: DefaultTabController(
              length: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // const CustomTopDetailsStackWidget(),
                    const CustomReligiousProgramWidget(isHasDes: false,),
                    TabBar(
                      tabs: const [
                        Tab(text: 'Over View'),
                        Tab(text: 'Details'),
                        Tab(text: 'Includes'),
                      ],
                      labelStyle: TextStyles.font17Black400WightLato,
                      indicatorColor: AppColorLight.primaryColor,
                      labelColor: AppColorLight.primaryColor,

                    ),
                    verticalSpace(15),
                    SizedBox(height: 350,
                      child:
                      TabBarView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left:16.w,right: 16.w),
                            child: const CustomDescriptionWidget(text: 'Lorem ipsum dolor sit amet consectetur. Facilisi nam quam tellus etiam non ut vel at magna. Felis porta fermentum . Lorem ipsum dolor sit amet consectetur. Facilisi nam quam tellus etiam non ut vel at magna. Felis porta fermentum', maxLines: 10,),),
                          const CustomTripDetailsWidget(color:Colors.white),
                          const CustomProgramIncludesWidget(color:Colors.white),
                        ],
                      ),),
                    verticalSpace(100),
                    CustomMaterialButtonWidget(text: 'Book Now', onPressed: (){
                      NavigatePages.pushToPage(const ConfirmBookingScreen(), context);
                    }),
                    verticalSpace(80),
                  ],
                ),
              ),
            ),
          )
      );


  }
}
