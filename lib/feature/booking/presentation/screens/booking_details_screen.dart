import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourist_tour_app/core/helpers/spacing.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/screens/program_details.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_religious_program_widget.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_top_detials_stack.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/widgets/custom_trip_details.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key, required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const CustomTopDetailsStackWidget(),
            verticalSpace(24),
             CustomReligiousProgramWidget(isHasDes: true,type: type,),
            verticalSpace(24),
            const CustomTripDetailsWidget(),
            verticalSpace(24),
          ],
        ),
      ),
    );
  }
}
