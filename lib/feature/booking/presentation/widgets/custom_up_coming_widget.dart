import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/feature/booking/logic/booking_cubit.dart';
import 'package:tourist_tour_app/feature/booking/presentation/screens/booking_details_screen.dart';
import 'package:tourist_tour_app/feature/booking/presentation/widgets/custom_program_item.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_bottom_sheet.dart';

import '../../../home/logic/home_cubit.dart';

class CustomUpComingWidget extends StatelessWidget {
  const CustomUpComingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    BookingCubit cubit =BookingCubit.get(context);
    return
      RefreshIndicator(
        onRefresh: ()async{
          await Future.delayed(const Duration(seconds: 1)).then((value) {
            cubit.getBookingPrograms(HomeCubit.get(context).token!,context,context.locale.toString());
          });
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: 50.h),
          child: BlocConsumer<BookingCubit, BookingState>(
            listener: (context, state) {},
            builder: (context, state) {
              if(cubit.getBookingProgramsList!=null){
                if(cubit.getBookingProgramsList!.isNotEmpty){
                  return
                    ListView.builder(
                      itemCount: cubit.getBookingProgramsList!.length,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            NavigatePages.pushToPage(
                                BookingDetailsScreen(type: 'up_coming'.tr(),
                                  bookingResponse:  cubit.getBookingProgramsList![index],), context);
                          },
                          child: CustomProgramItem(
                            programResponse: cubit.getBookingProgramsList![index],
                            textButtonText: 'cancel'.tr(),
                            onPressed: () {
                              showModalBottomSheet(
                            backgroundColor:Colors.white,
                            context: context,
                            isScrollControlled: true,
                            builder: (context) =>  CustomBottomSheet(
                              note: '${cubit.valueCanceled} ${cubit.noteControllerCanceled.text}', id: cubit.getBookingProgramsList![index].bookingId!,
                              name: cubit.getBookingProgramsList![index].name!,),
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
              ),
        ),
      );
  }
}
