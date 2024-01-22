import 'package:flutter/material.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/booking/presentation/screens/booking_details_screen.dart';
import 'package:tourist_tour_app/feature/booking/presentation/widgets/custom_program_item.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_bottom_sheet.dart';

class CustomUpComingWidget extends StatelessWidget {
  const CustomUpComingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          return InkWell(
            onTap: (){
              NavigatePages.persistentNavBarNavigator(const BookingDetailsScreen(type: 'Up Coming',), context);
            },
            child: CustomProgramItem(textButtonText: 'Cancel', onPressed: () {  showModalBottomSheet(
              backgroundColor:Colors.white,
              context: context,
              isScrollControlled: true,
              builder: (context) => const SingleChildScrollView(child: CustomBottomSheet()),
            ); },),
          );
    });
  }
}
