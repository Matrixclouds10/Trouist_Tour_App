import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/booking/logic/booking_cubit.dart';
import 'package:tourist_tour_app/feature/booking/presentation/screens/booking_details_screen.dart';
import 'package:tourist_tour_app/feature/booking/presentation/widgets/custom_program_item.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_bottom_sheet.dart';

class CustomUpComingWidget extends StatelessWidget {
  const CustomUpComingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    BookingCubit cubit =BookingCubit.get(context);
    return
      BlocConsumer<BookingCubit, DataState>(
        listener: (context, state) {},
        builder: (context, state) {
          if(cubit.getBookingProgramsList!=null){
            if(cubit.getBookingProgramsList!.isNotEmpty){
              return ListView.builder(
                  itemCount: cubit.getBookingProgramsList!.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        NavigatePages.pushToPage(const BookingDetailsScreen(type: 'Up Coming',), context);
                      },
                      child: CustomProgramItem(
                        programResponse: cubit.getBookingProgramsList![index],
                        textButtonText: 'Cancel', onPressed: () {  showModalBottomSheet(
                        backgroundColor:Colors.white,
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => const SingleChildScrollView(child: CustomBottomSheet()),
                      ); },),
                    );
                  });
            }else{
              return Center(child: Text('no_data_currently'.tr()),);
            }
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
    );
  }
}
