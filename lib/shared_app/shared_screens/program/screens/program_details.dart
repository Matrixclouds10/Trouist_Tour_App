import 'package:flutter/material.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/booking/presentation/screens/confirm_booking_screen.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/feature/our_programs/presentation/screens/program_details_overview_screen.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_program_includes.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_religious_program_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_top_detials_stack.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_trip_details.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_material_button.dart';

class ProgramDetailsScreen extends StatelessWidget {
  const ProgramDetailsScreen({super.key, this.type,  this.programResponse});
  final String? type;
  final ProgramResponse? programResponse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          CustomTopDetailsStackWidget(startDate: programResponse!.startDate!, day: programResponse!.duration, image: programResponse!.images!.map((e) => e.image).toList(),),
          verticalSpace(24),
          CustomReligiousProgramWidget(isHasDes: true,programResponse: programResponse!,),
          verticalSpace(24),
          CustomTripDetailsWidget(programResponse: programResponse!,),
          verticalSpace(24),
           CustomProgramIncludesWidget(programResponse: programResponse!,),
          verticalSpace(70),
          CustomMaterialButtonWidget(text: 'Book Now', onPressed: (){
            if(type=='offer'){
              NavigatePages.pushToPage(const ConfirmBookingScreen(), context);
            }else{
              NavigatePages.pushToPage(const ProgramDetailsOverViewScreen(), context);
            }
          }),
          verticalSpace(115),
        ],),
      ),
    );
  }
}