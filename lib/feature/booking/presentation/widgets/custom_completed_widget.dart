import 'package:flutter/material.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/booking/presentation/screens/booking_details_screen.dart';
import 'package:tourist_tour_app/feature/booking/presentation/screens/rate_screen.dart';
import 'package:tourist_tour_app/feature/booking/presentation/widgets/custom_program_item.dart';

class CustomCompleteWidget extends StatelessWidget {
  const CustomCompleteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: (){
          // NavigatePages.pushToPage( BookingDetailsScreen(type: 'Completed',), context);
        },
        child: CustomProgramItem(textButtonText: 'Review', onPressed: () {
          NavigatePages.pushToPage(const RateScreen(), context);

        },),
      ),
      InkWell(
        onTap: (){
          // NavigatePages.pushToPage(const BookingDetailsScreen(type: 'Completed',), context);
        },
        child: CustomProgramItem(textButtonText: 'Rate Your Program', onPressed: () {
          NavigatePages.pushToPage(const RateScreen(), context);

        },),
      ),
      InkWell(
        onTap: (){
          // NavigatePages.pushToPage(const BookingDetailsScreen(type: 'Completed',), context);
        },
        child: CustomProgramItem(textButtonText: 'View Rate', onPressed: () {
          NavigatePages.pushToPage(const RateScreen(), context);

        },),
      ),
    ],);
  }
}
