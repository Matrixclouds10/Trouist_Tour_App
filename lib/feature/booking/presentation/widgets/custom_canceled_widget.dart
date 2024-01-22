import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/booking/presentation/screens/booking_details_screen.dart';
import 'package:tourist_tour_app/feature/booking/presentation/widgets/custom_program_item.dart';
import 'package:tourist_tour_app/shared_app/shared_screens/program/screens/program_details.dart';

class CustomCanceledWidget extends StatelessWidget {
  const CustomCanceledWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          return InkWell(
            onTap: (){
              NavigatePages.persistentNavBarNavigator(const BookingDetailsScreen(type: 'Canceled',), context);
            },
            child: CustomProgramItem(textButtonText: 'Book Now', onPressed: () {

            },),
          );
        });
  }
}
