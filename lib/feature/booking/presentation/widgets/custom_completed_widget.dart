import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/booking/logic/booking_cubit.dart';
import 'package:tourist_tour_app/feature/booking/presentation/screens/booking_details_screen.dart';
import 'package:tourist_tour_app/feature/booking/presentation/screens/rate_screen.dart';
import 'package:tourist_tour_app/feature/booking/presentation/widgets/custom_program_item.dart';

class CustomCompleteWidget extends StatelessWidget {
  const CustomCompleteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BookingCubit cubit = BookingCubit.get(context);

    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {},
      builder: (context, state) {
        if(cubit.getCompletedProgramsList!=null){
          if(cubit.getCompletedProgramsList!.isNotEmpty){
            return ListView.builder(
                itemCount: cubit.getCompletedProgramsList!.length,
                itemBuilder: (context,index){
                  return  InkWell(
                    onTap: (){
                      NavigatePages.pushToPage( BookingDetailsScreen(type: 'Completed', bookingResponse: cubit.getCompletedProgramsList![index],), context);
                    },
                    child: CustomProgramItem(textButtonText: 'Review', onPressed: () {
                      NavigatePages.pushToPage(const RateScreen(), context);

                    },
                      programResponse: cubit.getCompletedProgramsList![index],),
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
/*
return Column(children: [
          // InkWell(
          //   onTap: (){
          //     // NavigatePages.pushToPage( BookingDetailsScreen(type: 'Completed',), context);
          //   },
          //   child: CustomProgramItem(textButtonText: 'Review', onPressed: () {
          //     NavigatePages.pushToPage(const RateScreen(), context);
          //
          //   },),
          // ),
          InkWell(
            onTap: () {
              // NavigatePages.pushToPage(const BookingDetailsScreen(type: 'Completed',), context);
            },
            child: CustomProgramItem(
              textButtonText: 'Rate Your Program', onPressed: () {
              NavigatePages.pushToPage(const RateScreen(), context);
            },),
          ),
          InkWell(
            onTap: () {
              // NavigatePages.pushToPage(const BookingDetailsScreen(type: 'Completed',), context);
            },
            child: CustomProgramItem(
              textButtonText: 'View Rate', onPressed: () {
              NavigatePages.pushToPage(const RateScreen(), context);
            },),
          ),
        ],);
 */