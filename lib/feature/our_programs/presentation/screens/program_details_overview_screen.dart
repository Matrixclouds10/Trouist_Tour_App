import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/themeing/styles/styles.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/booking/presentation/screens/confirm_booking_screen.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_description_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_program_includes.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_religious_program_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_top_detials_stack.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_trip_details.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';

class ProgramDetailsOverViewScreen extends StatefulWidget {
  const ProgramDetailsOverViewScreen({super.key, this.programResponse});
  final ProgramResponse? programResponse;
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
                     CustomTopDetailsStackWidget(image:widget.programResponse!.images!.map((e) => e.image!).toList(),startDate: widget.programResponse!.startDate,endDate: widget.programResponse!.startDate,),
                     CustomReligiousProgramWidget(
                       isHasDes: false, programResponse: widget.programResponse,),
                    TabBar(
                      tabs:  [
                        Tab(text: 'over_view'.tr()),
                        Tab(text: 'details'.tr()),
                        Tab(text: 'includes'.tr()),
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
                           CustomTripDetailsWidget(
                          programResponse: widget.programResponse,color:Colors.white),
                          CustomProgramIncludesWidget(programResponse: widget.programResponse,color:Colors.white),
                        ],
                      ),),
                    verticalSpace(100),
                    CustomMaterialButtonWidget(text: 'book_now'.tr(), onPressed: (){
                      NavigatePages.pushToPage( ConfirmBookingScreen(programResponse: widget.programResponse,), context);
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
